package org.openjfx.SoundCloud;

import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.ResourceBundle;
import java.util.Timer;
import java.util.TimerTask;

import org.openjfx.SoundCloud.base.Playlist;
import org.openjfx.SoundCloud.base.Song;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ProgressBar;
import javafx.scene.control.Slider;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.media.Media;
import javafx.scene.media.MediaPlayer;

public class MP3Controller implements Initializable {

    @FXML
    private Label songLabel;
    @FXML
    private Button playButton, previousButton, nextButton;
    @FXML
    private Slider volumeSlider;
    @FXML
    private ProgressBar songProgressBar;
    @FXML
    private ImageView playButtonImageView;

    private Media media;
    private MediaPlayer mediaPlayer;

    private File directory;
    private File[] files;

    private ArrayList<File> currentSongFiles;
    private Playlist currentPlaylist;
    private int songIndexInCurrentPlaylist;

    private Timer timer;
    private TimerTask task;

    private boolean running;

    @Override
    public void initialize(URL arg0, ResourceBundle arg1) {

        currentSongFiles = new ArrayList<File>();
        currentPlaylist = Helper.allSong;

        directory = new File(
                "D:/QuangWork/Github/MusicApp/SoundCloud/src/main/resources/org/openjfx/soundcloud/music");

        files = directory.listFiles();
        if (files != null) {
            // Sort the files based on their names in ascending order
            Arrays.sort(files, Comparator.comparingInt(file -> {
                String fileName = file.getName();
                int dotIndex = fileName.lastIndexOf(".");
                String numericPart = fileName.substring(0, dotIndex);
                return Integer.parseInt(numericPart);
            }));

            for (File file : files) {
                currentSongFiles.add(file);
            }
        }
        media = new Media(currentSongFiles.get(songIndexInCurrentPlaylist).toURI().toString());

        mediaPlayer = new MediaPlayer(media);

        songLabel.setText(currentPlaylist.getSongs().get(songIndexInCurrentPlaylist).getName());

        volumeSlider.valueProperty().addListener(new ChangeListener<Number>() {

            @Override
            public void changed(ObservableValue<? extends Number> arg0, Number arg1, Number arg2) {

                mediaPlayer.setVolume(volumeSlider.getValue() * 0.01);
            }
        });

        songProgressBar.setStyle("-fx-accent: #00FF00;");
    }

    public void playButtonClicked() {
        if (mediaPlayer.getStatus() == MediaPlayer.Status.PLAYING) {
            pauseMedia();
        } else {
            playMedia();
        }
    }

    public void playMedia() {
        beginTimer();
        mediaPlayer.setVolume(volumeSlider.getValue() * 0.01);
        mediaPlayer.play();
        playButtonImageView.setImage(new Image(
                "D:/QuangWork/Github/MusicApp/SoundCloud/src/main/resources/org/openjfx/soundcloud/pauseButton.png"));
    }

    public void pauseMedia() {
        cancelTimer();
        mediaPlayer.pause();
        playButtonImageView.setImage(new Image(
                "D:/QuangWork/Github/MusicApp/SoundCloud/src/main/resources/org/openjfx/soundcloud/playButton.png"));
    }

    public void previousMedia() {

        if (songIndexInCurrentPlaylist > 0) {

            songIndexInCurrentPlaylist--;

            mediaPlayer.stop();

            if (running) {

                cancelTimer();
            }

            media = new Media(currentSongFiles.get(songIndexInCurrentPlaylist).toURI().toString());
            mediaPlayer = new MediaPlayer(media);

            songLabel.setText(currentPlaylist.getSongs().get(songIndexInCurrentPlaylist).getName());

            playMedia();
        } else {

            songIndexInCurrentPlaylist = currentSongFiles.size() - 1;

            mediaPlayer.stop();

            if (running) {

                cancelTimer();
            }

            media = new Media(currentSongFiles.get(songIndexInCurrentPlaylist).toURI().toString());
            mediaPlayer = new MediaPlayer(media);

            songLabel.setText(currentPlaylist.getSongs().get(songIndexInCurrentPlaylist).getName());

            playMedia();
        }
    }

    public void nextMedia() {

        if (songIndexInCurrentPlaylist < currentSongFiles.size() - 1) {

            songIndexInCurrentPlaylist++;

            mediaPlayer.stop();

            if (running) {

                cancelTimer();
            }

            media = new Media(currentSongFiles.get(songIndexInCurrentPlaylist).toURI().toString());
            mediaPlayer = new MediaPlayer(media);

            songLabel.setText(currentPlaylist.getSongs().get(songIndexInCurrentPlaylist).getName());

            playMedia();
        } else {

            songIndexInCurrentPlaylist = 0;

            mediaPlayer.stop();

            media = new Media(currentSongFiles.get(songIndexInCurrentPlaylist).toURI().toString());
            mediaPlayer = new MediaPlayer(media);

            songLabel.setText(currentPlaylist.getSongs().get(songIndexInCurrentPlaylist).getName());

            playMedia();
        }
    }

    public void beginTimer() {

        timer = new Timer();

        task = new TimerTask() {

            public void run() {

                running = true;
                double current = mediaPlayer.getCurrentTime().toSeconds();
                double end = media.getDuration().toSeconds();
                songProgressBar.setProgress(current / end);

                if (current / end == 1) {

                    cancelTimer();
                }
            }
        };

        timer.scheduleAtFixedRate(task, 0, 1000);
    }

    public void cancelTimer() {

        running = false;
        timer.cancel();
    }

    public void playSong(Song song) {
        // Stop the current media player, if it is playing
        if (mediaPlayer != null) {
            mediaPlayer.stop();
            mediaPlayer.dispose();
        }

        int indexOfSongInCurrentPlaylist = currentPlaylist.getSongs().indexOf(song);

        // Create the file path using the song index
        media = new Media(currentSongFiles.get(indexOfSongInCurrentPlaylist).toURI().toString());
        mediaPlayer = new MediaPlayer(media);

        songIndexInCurrentPlaylist = indexOfSongInCurrentPlaylist;

        // Update the song label
        songLabel.setText(song.getName());

        // Play the song
        playMedia();
    }

    public void setPlaylist(Playlist playlist) {
        // If playlist is empty, do nothing
        if (playlist.getSongs().isEmpty()) {
            return;
        }
        // Stop the current media player, if it is playing
        if (mediaPlayer.getStatus() == MediaPlayer.Status.PLAYING) {
            mediaPlayer.stop();
        }
        currentSongFiles.clear();

        this.currentPlaylist = playlist;

        // Update the songs list in MP3Controller with the songs from the playlist
        for (int i = 0; i < playlist.getSongs().size(); i++) {
            int songID = playlist.getSongs().get(i).getSongID();
            currentSongFiles.add(files[songID]);
        }

        // Reset the song number to the first song in the playlist
        songIndexInCurrentPlaylist = 0;

        // Create a new Media instance with the first song in the playlist
        media = new Media(currentSongFiles.get(songIndexInCurrentPlaylist).toURI().toString());
        mediaPlayer = new MediaPlayer(media);

        // Update the song label
        songLabel.setText(currentPlaylist.getSongs().get(songIndexInCurrentPlaylist).getName());

        // Play the song
        playMedia();
    }
}