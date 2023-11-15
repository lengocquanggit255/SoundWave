package org.openjfx.SoundCloud;

import javafx.fxml.FXML;
import javafx.geometry.Insets;
import javafx.scene.control.ScrollPane;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.FlowPane;
import javafx.scene.text.Text;
import javafx.scene.text.TextFlow;

public class LyricController {

    @FXML
    private AnchorPane mainPane;

    @FXML
    private ScrollPane lyricScrollPane;

    @FXML
    private TextFlow lyricTextFlow;

    public void loadSongLyric(String lyric) {
        lyricTextFlow.getChildren().clear();
        Text text = new Text(lyric);
        text.setStyle("-fx-fill: #1ed760; -fx-font-size: 16pt; -fx-font-weight: bold;");

        FlowPane flowPane = new FlowPane();
        flowPane.setPadding(new Insets(0, 0, 0, 120));
        flowPane.getChildren().add(text);

        lyricTextFlow.getChildren().add(flowPane);
    }

    public AnchorPane getMainPane() {
        return mainPane;
    }

}
