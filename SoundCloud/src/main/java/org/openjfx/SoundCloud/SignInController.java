package org.openjfx.SoundCloud;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
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
            try {
                stage.setScene(new Scene(FXMLLoader.load(getClass().getResource("container.fxml"))));
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            emailTextField.setText("");
            passWordTextField.setText("");
            signInError.setVisible(true);
        }

    }

    @Override
    public void initialize(URL arg0, ResourceBundle arg1) {
        signInError.setVisible(false);
    }
}