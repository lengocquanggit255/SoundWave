package org.openjfx.SoundCloud;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;

import java.net.URL;
import java.util.ResourceBundle;

public class PlaylistController implements Initializable {

    @FXML
    private ListView<String> listView;

    @FXML
    private Button addButton;

    @FXML
    private Button removeButton;

    private ObservableList<String> playlist;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        // Initialize the playlist
        playlist = FXCollections.observableArrayList(
                "Song 1",
                "Song 2",
                "Song 3"
        );

        // Set the playlist to the ListView
        listView.setItems(playlist);

        // Add event handlers
        addButton.setOnAction(e -> addSong());
        removeButton.setOnAction(e -> removeSong());
    }

    @FXML
    private void addSong() {
        // TODO: Implement logic to add a song to the playlist
        // For this example, let's simply add a placeholder song
        playlist.add("New Song");
    }

    @FXML
    private void removeSong() {
        // TODO: Implement logic to remove a song from the playlist
        // For this example, let's simply remove the selected song
        int selectedIndex = listView.getSelectionModel().getSelectedIndex();
        if (selectedIndex >= 0 && selectedIndex < playlist.size()) {
            playlist.remove(selectedIndex);
        }
    }
}