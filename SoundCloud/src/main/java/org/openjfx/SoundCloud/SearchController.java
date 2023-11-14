package org.openjfx.SoundCloud;

import java.net.URL;
import java.util.List;
import java.util.ResourceBundle;

import org.openjfx.SoundCloud.base.Playlist;
import org.openjfx.SoundCloud.base.Song;

import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.MenuButton;
import javafx.scene.control.MenuItem;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;

public class SearchController implements Initializable {

    @FXML
    private AnchorPane mainPane;

    @FXML
    private Button searchButton;

    @FXML
    private ScrollPane searchScrollPane;

    @FXML
    private TextField searchTextField;

    @FXML
    private VBox searchVBox;

    private Playlist currentPlaylist;
    private MP3Controller mp3Controller;

    @Override
    public void initialize(URL arg0, ResourceBundle arg1) {
        searchScrollPane.setHbarPolicy(ScrollPane.ScrollBarPolicy.NEVER);
        searchScrollPane.setFitToWidth(true);
    }

    @FXML
    public void search() {
        String input = searchTextField.getText();
        currentPlaylist = Helper.searchSongsByName(input);
        loadPlaylist();

    }

    public void setMP3Controller(MP3Controller mp3Controller) {
        this.mp3Controller = mp3Controller;
    }

    public AnchorPane getMainPane() {
        return this.mainPane;
    }

    private void loadPlaylist() {
        searchVBox.getChildren().clear();
        // Load and display the songs
        for (int i = 0; i < currentPlaylist.size(); i++) {
            Song song = currentPlaylist.getSongs().get(i);
            // Create an HBox for each song
            HBox songHBox = new HBox();
            songHBox.setAlignment(Pos.CENTER_LEFT); // Set alignment to center-left
            songHBox.setPrefSize(823, 65);// Set preferred size of the HBox
            // Add an onClick action to the songHBox
            songHBox.setOnMouseClicked((EventHandler<? super MouseEvent>) new EventHandler<MouseEvent>() {
                @Override
                public void handle(MouseEvent event) {
                    // Call the playSong method of the mp3Controller
                    mp3Controller.setPlaylist(currentPlaylist);
                    mp3Controller.playSong(song);
                }
            });

            // Create labels for song information
            Label orderLabel = new Label(Integer.toString(i + 1));
            // Set preferred size of the orderLabel
            orderLabel.setPrefSize(25, 25);
            orderLabel.setAlignment(Pos.CENTER);
            Font font = Font.font("System", 12);
            orderLabel.setFont(font);
            orderLabel.setTextFill(Color.WHITE);

            // Create an ImageView for the song
            ImageView imageView = new ImageView(new Image(
                    "D:/QuangWork/Github/MusicApp/SoundCloud/src/main/resources/org/openjfx/soundcloud/playList_default_img.jpg"));
            imageView.setFitWidth(55); // Set the desired width of the ImageView
            imageView.setFitHeight(55); // Set the desired height of the ImageView
            // Set the margin for the ImageView
            HBox.setMargin(imageView, new Insets(0, 0, 0, 10)); // Left margin of 10

            VBox songInfoVBox = new VBox();
            songInfoVBox.setPrefSize(458, 65); // Set preferred size of the VBox
            // Create the labels for song name and artist
            Label nameLabel = new Label(song.getName());
            nameLabel.setAlignment(Pos.CENTER_LEFT);
            nameLabel.setPrefSize(250, 28);
            font = Font.font("System", FontWeight.BOLD, 14);
            nameLabel.setFont(font);
            nameLabel.setTextFill(Color.WHITE);

            Label artistLabel = new Label(song.getArtists().get(0).getNames());
            artistLabel.setAlignment(Pos.CENTER_LEFT);
            artistLabel.setPrefSize(79, 17);
            font = Font.font("System", 12);
            artistLabel.setFont(font);
            artistLabel.setTextFill(Color.WHITE);
            // Set the margins for the labels
            VBox.setMargin(nameLabel, new Insets(5, 0, 0, 0)); // Top margin of 5
            VBox.setMargin(artistLabel, new Insets(7, 0, 0, 0)); // Top margin of 7
            // Add the labels to the songInfoVBox
            songInfoVBox.getChildren().addAll(nameLabel, artistLabel);
            HBox.setMargin(songInfoVBox, new Insets(0, 0, 0, 12)); // Left margin of 12

            // Create labels for song dateReleased
            Label dateReleasedLabel = new Label(song.getReleaseDate().toString());
            // Set preferred size of the dateReleasedLabel
            dateReleasedLabel.setPrefSize(95, 65);
            dateReleasedLabel.setAlignment(Pos.CENTER);
            font = Font.font("System", 12);
            dateReleasedLabel.setFont(font);
            dateReleasedLabel.setTextFill(Color.WHITE);

            // Create a "Add new song into playlist" menu item
            MenuButton addSongIntoPlaylistMenuButton = new MenuButton("Playlists");

            // Get the user's playlist collection
            List<Playlist> currentUserPlaylists = Helper.currentUser.getPlaylists();

            // Iterate through the playlists and create MenuItems for each one
            for (Playlist p : currentUserPlaylists) {
                // Check to see if the song already exists in the playlist
                if (p.getPlaylistID() != currentPlaylist.getPlaylistID()) {
                    MenuItem playlistMenuItem = new MenuItem(p.getName());
                    playlistMenuItem.setOnAction(event -> {
                        // Action for the playlist menu item
                        p.addSong(song);
                    });
                    addSongIntoPlaylistMenuButton.getItems().add(playlistMenuItem);
                }
            }
            // Create a menu item and set graphic to addSongIntoPlaylistMenuButton
            MenuItem addSongMenuItem = new MenuItem("Add Song to Playlist");
            addSongMenuItem.setGraphic(addSongIntoPlaylistMenuButton);

            MenuButton optionMenuButton = new MenuButton("Options");
            optionMenuButton.getItems().addAll(addSongMenuItem);
            HBox.setMargin(optionMenuButton, new Insets(0, 0, 0, 12)); // Left margin of 90
            // Create labels for song dateReleased
            Label lengthLabel = new Label(Integer.toString(song.getLength()) + ":00");
            // Set preferred size of the lengthLabel
            lengthLabel.setPrefSize(52, 65);
            lengthLabel.setAlignment(Pos.CENTER_LEFT);
            lengthLabel.setTextFill(Color.WHITE);
            HBox.setMargin(lengthLabel, new Insets(0, 0, 0, 90)); // Left margin of 90

            // Add all the elements to the song HBox
            songHBox.getChildren().addAll(orderLabel, imageView, songInfoVBox, dateReleasedLabel, optionMenuButton,
                    lengthLabel);

            // Add the song HBox to the song VBox
            searchVBox.getChildren().add(songHBox);
            VBox.setMargin(songHBox, new Insets(10, 0, 0, 0));

        }

        // Set the song VBox as the content of the song scroll pane
        searchScrollPane.setContent(searchVBox);
    }

}
