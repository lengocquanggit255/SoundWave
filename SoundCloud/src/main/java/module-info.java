module SoundCloud {
    requires javafx.controls;
    requires javafx.fxml;
    requires javafx.web;
    requires javafx.media;
    
    requires transitive java.sql;
    requires transitive javafx.graphics;

    opens org.openjfx.SoundCloud to javafx.fxml;

    exports org.openjfx.SoundCloud;
    exports org.openjfx.SoundCloud.base;
}