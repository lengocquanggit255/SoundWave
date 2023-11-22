package org.openjfx.SoundCloud;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
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
    @FXML
    private Button homeButton;
    @FXML
    private Button searchButton;

    private AnchorPane mp3Pane;
    private AnchorPane playlistPane;

    private PlaylistContentController playlistContentController;
    private PlaylistController playlistController;
    private MP3Controller mp3Controller;
    private AddPlaylistController addPlaylistController;
    private HomeController homeController;
    private HomePlaylistContentController homePlaylistContentController;
    private SearchController searchController;
    private LyricController lyricController;

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
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("playlistContentHomePane.fxml"));
            fxmlLoader.load();
            homePlaylistContentController = fxmlLoader.getController();

        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("playlistContentPane.fxml"));
            fxmlLoader.load();
            playlistContentController = fxmlLoader.getController();

        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("addPlaylistPane.fxml"));
            fxmlLoader.load();
            addPlaylistController = fxmlLoader.getController();

        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("playlistPane.fxml"));
            playlistPane = fxmlLoader.load();
            playlistController = fxmlLoader.getController();
        } catch (IOException e) {
            e.printStackTrace();
        }
        anchorPlaylistPane.getChildren().add(playlistPane);

        try {
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("homePane.fxml"));
            fxmlLoader.load();
            homeController = fxmlLoader.getController();
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("searchPane.fxml"));
            fxmlLoader.load();
            searchController = fxmlLoader.getController();
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("lyricPane.fxml"));
            fxmlLoader.load();
            lyricController = fxmlLoader.getController();
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Set controller
        homeController.setHomePlaylistContentController(homePlaylistContentController);
        homeController.setContainerController(this);
        playlistController.setContainerController(this);
        playlistController.setPlaylistContentController(playlistContentController);
        playlistController.setAddPlaylistController(addPlaylistController);
        addPlaylistController.setPlaylistController(playlistController);
        playlistContentController.setMP3Controller(mp3Controller);
        playlistContentController.setPlaylistController(playlistController);
        playlistContentController.setContainerController(this);
        homePlaylistContentController.setContainerController(this);
        homePlaylistContentController.setMP3Controller(mp3Controller);
        searchController.setMP3Controller(mp3Controller);
        mp3Controller.setContainerController(this);
        mp3Controller.setLyricController(lyricController);

        // Set default pane is homePane
        anchorContentPane.getChildren().add(homeController.getMainPane());
    }

    public void setContentPane(AnchorPane pane) {
        anchorContentPane.getChildren().clear();
        if (pane != null) {
            anchorContentPane.getChildren().add(pane);
        } else {
            anchorContentPane.getChildren().add(homeController.getMainPane());
        }
    }

    public void homeButtonClick() {
        setContentPane(homeController.getMainPane());
    }

    public void searchButtonClick() {
        setContentPane(searchController.getMainPane());
        searchController.reload();
    }

}