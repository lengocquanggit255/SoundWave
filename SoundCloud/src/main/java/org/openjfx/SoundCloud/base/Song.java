package org.openjfx.SoundCloud.base;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Song {
    private int songID;
    private String name;
    private int length;
    private List<String> genres;
    private List<Artist> artists;
    private Date releaseDate;
    private String lyrics;

    // Constructors, getters, and setters

    public Song() {
        genres = new ArrayList<String>();
        artists = new ArrayList<Artist>();
    }

    public Song(int songID, String name, int length, List<String> genres, List<Artist> artists, Date releaseDate,
            String lyrics) {
        this.songID = songID;
        this.name = name;
        this.length = length;
        this.genres = genres;
        this.artists = artists;
        this.releaseDate = releaseDate;
        this.lyrics = lyrics;
    }

    public int getSongID() {
        return songID;
    }

    public void setSongID(int songID) {
        this.songID = songID;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public List<String> getGenres() {
        return genres;
    }

    public void setGenres(List<String> genres) {
        this.genres = genres;
    }

    public List<Artist> getArtists() {
        return artists;
    }

    public void setArtists(List<Artist> artists) {
        this.artists = artists;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getLyrics() {
        return lyrics;
    }

    public void setLyrics(String lyrics) {
        this.lyrics = lyrics;
    }
}