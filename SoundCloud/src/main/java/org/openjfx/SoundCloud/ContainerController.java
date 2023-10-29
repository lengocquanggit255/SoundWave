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

    @Override
    public void initialize(URL arg0, ResourceBundle arg1) {
        try {
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("mp3Pane.fxml"));
            mp3Pane = fxmlLoader.load();
        } catch (IOException e) {
            e.printStackTrace();
        }
        anchorMP3Pane.getChildren().add(mp3Pane);

        try {
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("playlistPane.fxml"));
            playlistPane = fxmlLoader.load();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (playlistPane == null) {
            System.out.println("playlistPane is null");
        }
        anchorPlaylistPane.getChildren().add(playlistPane);
    }

}