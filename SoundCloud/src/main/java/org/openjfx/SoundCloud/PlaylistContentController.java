package org.openjfx.SoundCloud;

import java.net.URL;
import java.util.ResourceBundle;

import org.openjfx.SoundCloud.base.Playlist;
import org.openjfx.SoundCloud.base.Song;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.VBox;

public class PlaylistContentController implements Initializable {
    @FXML
    private AnchorPane mainAnchorPane;

    @FXML
    private Label playlistNameLabel;

    @FXML
    private ScrollPane songScrollPane;

    @FXML
    private VBox songVBox;

    @FXML
    private Label userNameLabel;

    public void loadPlaylist(Playlist playlist) {

        songScrollPane.setHbarPolicy(ScrollPane.ScrollBarPolicy.NEVER);
        songScrollPane.setFitToWidth(true);
        // Set the playlist name
        playlistNameLabel.setText(playlist.getName());

        // Set the username
        userNameLabel.setText(Helper.currentUser.getUsername());

        // Clear existing song items
        songVBox.getChildren().clear();

        // Load and display the songs
        for (Song song : playlist.getSongs()) {
            // Create a label for each song
            Label songLabel = new Label(song.getName());
            songVBox.getChildren().add(songLabel);
        }

        songScrollPane.setContent(songVBox);
    }

    @Override
    public void initialize(URL arg0, ResourceBundle arg1) {

    }

    public AnchorPane getMainPane() {
        return mainAnchorPane;
    }
}
