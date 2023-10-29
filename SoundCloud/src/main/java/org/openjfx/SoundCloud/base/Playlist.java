package org.openjfx.SoundCloud.base;

import java.util.ArrayList;
import java.util.List;

public class Playlist {
    private int playlistID;
    private String name;
    private List<Song> songs;

    // Constructors, getters, and setters
    public Playlist() {
        songs = new ArrayList<Song>();
    }

    public Playlist(int playlistID, String name, List<Song> songs) {
        this.playlistID = playlistID;
        this.name = name;
        this.songs = songs;
    }

    public void addSong(Song newSong) {
        for (int i = 0; i < songs.size(); i++) {
            if (newSong.getSongID() == songs.get(i).getSongID()) {
                return;
            }
        }
        songs.add(newSong);
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

    public List<Song> getSongs() {
        return songs;
    }

    public void setSongs(List<Song> songs) {
        this.songs = songs;
    }
}