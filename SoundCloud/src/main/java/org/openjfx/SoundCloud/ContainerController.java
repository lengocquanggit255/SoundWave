package org.openjfx.SoundCloud;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.layout.AnchorPane;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class ContainerController implements Initializable {
    @FXML
    public AnchorPane main_pane;
    @FXML
    public AnchorPane anchorContentPane;
    @FXML
    public AnchorPane anchorMP3Pane;
    @FXML
    public AnchorPane anchorPlaylistPane;

    private AnchorPane mp3Pane;
    private AnchorPane playlistPane;

    private PlaylistContentController playlistContentController;
    private PlaylistController playlistController;
    private MP3Controller mp3Controller;
    private AddPlaylistController addPlaylistController;

    @Override
    public void initialize(URL arg0, ResourceBundle arg1) {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("mp3Pane.fxml"));
            mp3Pane = fxmlLoader.load();
            mp3Controller = fxmlLoader.getController();
        } catch (IOException e) {
            e.printStackTrace();
        }
        anchorMP3Pane.getChildren().add(mp3Pane);

        try {
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("playlistContentPane.fxml"));
            AnchorPane playlistContentPane = fxmlLoader.load();
            playlistContentController = fxmlLoader.getController();
            playlistContentController.setMP3Controller(mp3Controller);

        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("addPlaylistPane.fxml"));
            AnchorPane addPlaylistPane = fxmlLoader.load();
            addPlaylistController = fxmlLoader.getController();
            
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        try {
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("playlistPane.fxml"));
            playlistPane = fxmlLoader.load();
            playlistController = fxmlLoader.getController();
            playlistController.setContainerController(this);
            playlistController.setPlaylistContentController(playlistContentController);
            playlistController.setAddPlaylistController(addPlaylistController);
            addPlaylistController.setPlaylistController(playlistController);
        } catch (IOException e) {
            e.printStackTrace();
        }
        anchorPlaylistPane.getChildren().add(playlistPane);
    }

    public void setContentPane(AnchorPane pane) {
        anchorContentPane.getChildren().clear();
        anchorContentPane.getChildren().add(pane);
    }
}