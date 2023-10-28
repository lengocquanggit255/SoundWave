package org.openjfx.SoundCloud.base;

import java.util.List;

public class Playlist {
    private int playlistID;
    private String name;
    private int numberOfSongs;
    private int totalLength;
    private User owner;
    private List<Song> songs;

    // Constructors, getters, and setters

    public Playlist(int playlistID, String name, int numberOfSongs, int totalLength, User owner, List<Song> songs) {
        this.playlistID = playlistID;
        this.name = name;
        this.numberOfSongs = numberOfSongs;
        this.totalLength = totalLength;
        this.owner = owner;
        this.songs = songs;
    }

    public int getPlaylistID() {
        return playlistID;
    }

    public void setPlaylistID(int playlistID) {
        this.playlistID = playlistID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNumberOfSongs() {
        return numberOfSongs;
    }

    public void setNumberOfSongs(int numberOfSongs) {
        this.numberOfSongs = numberOfSongs;
    }

    public int getTotalLength() {
        return totalLength;
    }

    public void setTotalLength(int totalLength) {
        this.totalLength = totalLength;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public List<Song> getSongs() {
        return songs;
    }

    public void setSongs(List<Song> songs) {
        this.songs = songs;
    }
}