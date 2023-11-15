package org.openjfx.SoundCloud;

import java.io.IOException;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Rectangle2D;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.scene.text.Text;
import javafx.stage.Screen;
import javafx.stage.Stage;

public class SignUpController {

    @FXML
    private Button SignUpButton;

    @FXML
    private Text logInText;

    @FXML
    private TextField emailTextField;

    @FXML
    private Label errorLabel;

    @FXML
    private TextField passWordTextField;

    @FXML
    private TextField usernameTextField;

    @FXML
    private void handleSignUpButtonAction(ActionEvent event) {
        String email = emailTextField.getText();
        String password = passWordTextField.getText();
        String username = usernameTextField.getText();

        // Validate the entered information and handle possible errors
        String errorMessage = validateSignUp(email, password, username);
        if (errorMessage.isEmpty()) {
            // Create a new User object with the entered information
            Helper.createUser(username, password, email);

            // Clear the text fields
            emailTextField.clear();
            passWordTextField.clear();
            usernameTextField.clear();

            // Show a success message or perform any other necessary actions
            errorLabel.setText("Sign up successful!");
        } else {
            // Display the error message on the error label
            errorLabel.setText(errorMessage);
        }
    }

    private String validateSignUp(String email, String password, String username) {
        // Perform validation checks on the entered information
        // Return an error message if any validation fails, or an empty string if there
        // are no errors
        if (username.isEmpty()) {
            return "Username cannot be empty";
        }

        if (password.length() < 8) {
            return "Username must be at least 8 character";
        }

        if (password.isEmpty()) {
            return "Password cannot be empty";
        }

        if (password.length() < 8) {
            return "Password must be at least 8 character";
        }
        
        if (email.isEmpty() || !email.contains("@email")) {
            return "This email is invalid. Make sure it's written like example@email.com";
        }

        if (!Helper.isValidEmail(email)) {
            return "Email is already existed";
        }

        // Additional validation checks can be added as per your requirements

        return ""; // No errors
    }

    @FXML
    void mouseClickLogInText(MouseEvent event) {
        Stage stage = (Stage) logInText.getScene().getWindow();
        try {
            Parent signInRoot = FXMLLoader.load(getClass().getResource("signInPane.fxml"));
            Scene signInScene = new Scene(signInRoot);

            // Set the new scene
            stage.setScene(signInScene);

            // Center the stage on the screen
            centerStageOnScreen(stage);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @FXML
    void mouseEnterLogInText(MouseEvent event) {
        logInText.setStyle("-fx-fill: #1ed760");
    }

    @FXML
    void mouseExitLogInText(MouseEvent event) {
        logInText.setStyle("-fx-fill: #ffffff");
    }

    private void centerStageOnScreen(Stage stage) {
        Rectangle2D screenBounds = Screen.getPrimary().getVisualBounds();
        stage.setX((screenBounds.getWidth() - stage.getWidth()) / 2);
        stage.setY((screenBounds.getHeight() - stage.getHeight()) / 2);
    }

}
