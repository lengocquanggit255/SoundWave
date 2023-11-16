package org.openjfx.SoundCloud;

import java.net.URL;
import java.util.List;
import java.util.ResourceBundle;

import org.openjfx.SoundCloud.base.Playlist;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;

public class HomeController implements Initializable {

    @FXML
    private AnchorPane mainPane;

    @FXML
    private HBox playlistHBox0;

    @FXML
    private HBox playlistHBox1;

    @FXML
    private HBox playlistHBox2;

    @FXML
    private HBox playlistHBox3;

    @FXML
    private HBox playlistHBox4;

    @FXML
    private HBox playlistHBox5;

    @FXML
    private VBox playlistVBox0;

    @FXML
    private VBox playlistVBox1;

    @FXML
    private VBox playlistVBox2;

    @FXML
    private VBox playlistVBox3;

    private HomePlaylistContentController homePlaylistContentController;
    private ContainerController containerController;

    private List<Playlist> playlists = Helper.getPlaylistOfAdmin();

    @Override
    public void initialize(URL arg0, ResourceBundle arg1) {
        // Add click event handlers to the HBox elements
        playlistHBox0.setOnMouseClicked(event -> handlePlaylistClick(0));
        playlistHBox1.setOnMouseClicked(event -> handlePlaylistClick(1));
        playlistHBox2.setOnMouseClicked(event -> handlePlaylistClick(2));
        playlistHBox3.setOnMouseClicked(event -> handlePlaylistClick(3));
        playlistHBox4.setOnMouseClicked(event -> handlePlaylistClick(4));
        playlistHBox5.setOnMouseClicked(event -> handlePlaylistClick(5));
        playlistVBox0.setOnMouseClicked(event -> handlePlaylistClick(6));
        playlistVBox1.setOnMouseClicked(event -> handlePlaylistClick(7));
        playlistVBox2.setOnMouseClicked(event -> handlePlaylistClick(8));
        playlistVBox3.setOnMouseClicked(event -> handlePlaylistClick(9));
    }

    // Event handler for handling HBox click events
    private void handlePlaylistClick(int index) {
        Playlist selectedPlaylist = playlists.get(index);
        switch (index) {
            case 0:
                homePlaylistContentController.setPlaylistImageView("AiCungPhaiBatDauTuDauDo.png");
                break;
            case 1:
                homePlaylistContentController.setPlaylistImageView("EverydayIsChristmas.png");
                break;
            case 2:
                homePlaylistContentController.setPlaylistImageView("LOV6.png");
                break;
            case 3:
                homePlaylistContentController.setPlaylistImageView("4YourEyezOnly.jpg");
                break;
            case 4:
                homePlaylistContentController.setPlaylistImageView("HerLoss.jpg");
                break;
            case 5:
                homePlaylistContentController.setPlaylistImageView("MadeInLagos.png");
                break;
            case 6:
                homePlaylistContentController.setPlaylistImageView("AmericanTeen.png");
                break;
            case 7:
                homePlaylistContentController.setPlaylistImageView("FlowerBoy.png");
                break;
            case 8:
                homePlaylistContentController.setPlaylistImageView("LoveSick.jpg");
                break;
            case 9:
                homePlaylistContentController.setPlaylistImageView("222.png");
                break;
            default:
                homePlaylistContentController.setPlaylistImageView("AiCungPhaiBatDauTuDauDo.png");
        }
        homePlaylistContentController.loadPlaylist(selectedPlaylist);
        containerController.setContentPane(homePlaylistContentController.getMainPane());

    }

    public AnchorPane getMainPane() {
        return this.mainPane;
    }

    public void setHomePlaylistContentController(HomePlaylistContentController playlistContentController) {
        this.homePlaylistContentController = playlistContentController;
    }

    public void setContainerController(ContainerController containerController) {
        this.containerController = containerController;
    }

}
