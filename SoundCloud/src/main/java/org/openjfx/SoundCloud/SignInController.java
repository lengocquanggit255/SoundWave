package org.openjfx.SoundCloud;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import org.openjfx.SoundCloud.base.User;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.geometry.Rectangle2D;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class SignInController implements Initializable {

    @FXML
    private Button SignInButton;

    @FXML
    private TextField emailTextField;

    @FXML
    private TextField passWordTextField;

    @FXML
    private Label signInError;

    @FXML
    private void handleSignInButtonAction(ActionEvent event) {

        if (Helper.checkPassword(emailTextField.getText(), passWordTextField.getText())) {
            Stage stage = (Stage) SignInButton.getScene().getWindow();
            Helper.currentUser = Helper.getUserByID(Helper.getUserIdFromEmail(emailTextField.getText()));
            try {
                Parent containerRoot = FXMLLoader.load(getClass().getResource("container.fxml"));
                Scene containerScene = new Scene(containerRoot);

                // Set the new scene
                stage.setScene(containerScene);

                // Center the stage on the screen
                centerStageOnScreen(stage);

            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            emailTextField.setText("");
            passWordTextField.setText("");
            signInError.setVisible(true);
        }
    }

    private void centerStageOnScreen(Stage stage) {
        Rectangle2D screenBounds = Screen.getPrimary().getVisualBounds();
        stage.setX((screenBounds.getWidth() - stage.getWidth()) / 2);
        stage.setY((screenBounds.getHeight() - stage.getHeight()) / 2);
    }

    @Override
    public void initialize(URL arg0, ResourceBundle arg1) {
        signInError.setVisible(false);
    }
}