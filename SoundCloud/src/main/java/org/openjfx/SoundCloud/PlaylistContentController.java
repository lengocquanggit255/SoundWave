package org.openjfx.SoundCloud;

import java.net.URL;
import java.util.ResourceBundle;

import org.openjfx.SoundCloud.base.Playlist;
import org.openjfx.SoundCloud.base.Song;

import javafx.css.PseudoClass;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollBar;
import javafx.scene.control.ScrollPane;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.ScrollEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;

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
        // Set the playlist name
        playlistNameLabel.setText(playlist.getName());

        // Set the username
        userNameLabel.setText(Helper.currentUser.getUsername());

        // Clear existing song items
        songVBox.getChildren().clear();

        // Load and display the songs
        for (int i = 0; i < playlist.size(); i++) {
            Song song = playlist.getSongs().get(i);
            // Create an HBox for each song
            HBox songHBox = new HBox();
            songHBox.setAlignment(Pos.CENTER_LEFT); // Set alignment to center-left
            songHBox.setPrefSize(823, 65);// Set preferred size of the HBox

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
            Label nameLabel = new Label("Name: " + song.getName());
            nameLabel.setAlignment(Pos.CENTER_LEFT);
            nameLabel.setPrefSize(213, 28);
            font = Font.font("System", FontWeight.BOLD, 14);
            nameLabel.setFont(font);
            nameLabel.setTextFill(Color.WHITE);

            Label artistLabel = new Label("Artist: " + song.getArtists().toString());
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
            HBox.setMargin(dateReleasedLabel, new Insets(0, 0, 0, 10)); // Left margin of 10

            // Create labels for song dateReleased
            Label lengthLabel = new Label(Integer.toString(song.getLength()) + ":00");
            // Set preferred size of the lengthLabel
            lengthLabel.setPrefSize(52, 65);
            lengthLabel.setAlignment(Pos.CENTER_LEFT);
            font = Font.font("System", 12);
            lengthLabel.setFont(font);
            lengthLabel.setTextFill(Color.WHITE);
            HBox.setMargin(lengthLabel, new Insets(0, 0, 0, 90)); // Left margin of 10

            songHBox.getChildren().addAll(orderLabel, imageView, songInfoVBox, dateReleasedLabel, lengthLabel);
            songVBox.getChildren().add(songHBox);
        }

        songScrollPane.setContent(songVBox);
    }

    @Override
    public void initialize(URL arg0, ResourceBundle arg1) {
        songScrollPane.setHbarPolicy(ScrollPane.ScrollBarPolicy.NEVER);
        songScrollPane.setFitToWidth(true);

        ScrollBar vBar = (ScrollBar) songScrollPane.lookup(".scroll-bar:vertical");
        if (vBar != null) {
            vBar.setOpacity(0);
        }
    }

    public AnchorPane getMainPane() {
        return mainAnchorPane;
    }
}
