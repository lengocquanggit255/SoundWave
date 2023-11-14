package org.openjfx.SoundCloud;

import javafx.fxml.FXML;
import javafx.scene.control.ScrollPane;
import javafx.scene.layout.AnchorPane;
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
        lyricTextFlow.getChildren().add(text);
    }

    public AnchorPane getMainPane() {
        return mainPane;
    }

}
