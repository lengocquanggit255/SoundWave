package org.openjfx.SoundCloud.base;

import java.util.ArrayList;
import java.util.List;

import org.openjfx.SoundCloud.Helper;

public class User {
    private int userID;
    private String username;
    private List<Playlist> playlists;

    public User() {
        playlists = new ArrayList<Playlist>();
    }

    public User(int userID, String username) {
        this.userID = userID;
        this.username = username;
        playlists = Helper.getPlaylistByUserID(userID);
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}