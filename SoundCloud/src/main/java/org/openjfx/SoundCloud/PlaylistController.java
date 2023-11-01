package org.openjfx.SoundCloud;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ScrollPane;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.VBox;

import java.net.URL;
import java.util.List;
import java.util.ResourceBundle;

import org.openjfx.SoundCloud.base.Playlist;

public class PlaylistController implements Initializable {

    @FXML
    private VBox playlistVBox;

    @FXML
    private ScrollPane playlistScrollPane;

    private List<Playlist> playlists = Helper.currentUser.getPlaylists();

    private ContainerController containerController;
    private PlaylistContentController playlistContentController;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        playlistScrollPane.setHbarPolicy(ScrollPane.ScrollBarPolicy.NEVER);
        playlistScrollPane.setFitToWidth(true);

        for (Playlist playlist : playlists) {
            ImageView playlistImageView = new ImageView(new Image(
                    "D:/QuangWork/Github/MusicApp/SoundCloud/src/main/resources/org/openjfx/soundcloud/playList_default_img.jpg"));
            playlistImageView.setFitWidth(60);
            playlistImageView.setFitHeight(60);
            Button playlistButton = new Button();
            playlistButton.setPrefSize(70, 70);
            playlistButton.setGraphic(playlistImageView);
            playlistButton.setStyle("-fx-background-color: #121212;");

            // Set the graphic (image) for the button
            playlistButton.setGraphic(playlistImageView);

            playlistButton.setOnAction(event -> {
                playlistContentController.loadPlaylist(playlist);
                containerController.setContentPane(playlistContentController.getMainPane());
            });
            playlistVBox.getChildren().add(playlistButton);
        }

        playlistScrollPane.setContent(playlistVBox);
    }

    public void setContainerController(ContainerController containerController) {
        this.containerController = containerController;
    }

    public void setPlaylistContentController(PlaylistContentController playlistContentController) {
        this.playlistContentController = playlistContentController;
    }
}