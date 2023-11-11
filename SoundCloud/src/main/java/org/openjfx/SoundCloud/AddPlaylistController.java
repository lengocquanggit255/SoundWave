package org.openjfx.SoundCloud;

import java.net.URL;
import java.util.ResourceBundle;

import org.openjfx.SoundCloud.base.Playlist;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;

public class AddPlaylistController implements Initializable {

    @FXML
    private Button saveButton;

    @FXML
    private AnchorPane mainAnchorPane;

    @FXML
    private TextField playlistNameTextField;

    @FXML
    private TextField playlistDescriptionTextField;

    @FXML
    private PlaylistController playlistController;

    public AnchorPane getMainPane() {
        return mainAnchorPane;
    }

    @FXML
    private void onSaveButtonClicked() {
        String playlistName = playlistNameTextField.getText();
        Playlist newPlaylist = new Playlist(playlistName);
        Helper.currentUser.getPlaylists().add(newPlaylist);

        // Reset the input fields
        playlistNameTextField.clear();
        playlistDescriptionTextField.clear();
        playlistController.addNewPlaylist(newPlaylist);
    }

    @Override
    public void initialize(URL arg0, ResourceBundle arg1) {

    }

    public void setPlaylistController(PlaylistController playlistController) {
        this.playlistController = playlistController;
    }
}
