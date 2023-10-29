package org.openjfx.SoundCloud;

import java.io.IOException;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.stage.Stage;

public class SignInController {

    @FXML
    private Button SignInButton;

    @FXML
    private void handleSignInButtonAction(ActionEvent event) {
        Stage stage = (Stage) SignInButton.getScene().getWindow();
        try {
            stage.setScene(new Scene(FXMLLoader.load(getClass().getResource("container.fxml"))));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}