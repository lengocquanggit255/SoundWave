package org.openjfx.SoundCloud;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.openjfx.SoundCloud.base.Artist;
import org.openjfx.SoundCloud.base.Song;

public class Helper {
    private Connection connection;

    // Constructor
    public Helper(Connection connection) {
        this.connection = connection;
    }

    public Song getSongByID(int songID) throws SQLException {
        String query = "SELECT * FROM Songs WHERE songID = ?";
        Song song = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            statement = connection.prepareStatement(query);
            statement.setInt(1, songID);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int length = resultSet.getInt("length_minutes");
                List<String> genres = getGenresForSong(songID);
                List<Artist> artists = getArtistsForSong(songID);
                Date releaseDate = resultSet.getDate("released_date");
                String lyrics = resultSet.getString("lyrics");

                song = new Song(songID, length, genres, artists, releaseDate, lyrics);
            }

            return song;
        } finally {
            // Close resources in the reverse order of their creation to avoid resource
            // leaks
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
        }
    }

    private List<String> getGenresForSong(int songID) throws SQLException {
        String query = "SELECT genre_name FROM Songs_Genres INNER JOIN Genres ON Songs_Genres.genreID = Genres.genreID WHERE songID = ?";
        List<String> genres = new ArrayList<>();
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            statement = connection.prepareStatement(query);
            statement.setInt(1, songID);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String genre = resultSet.getString("genre_name");
                genres.add(genre);
            }

            return genres;
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
        }
    }

    private List<Artist> getArtistsForSong(int songID) throws SQLException {
        String query = "SELECT * FROM Songs_Artists INNER JOIN Artists ON Songs_Artists.artistID = Artists.artistID WHERE songID = ?";
        List<Artist> artists = new ArrayList<>();
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            statement = connection.prepareStatement(query);
            statement.setInt(1, songID);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int artistID = resultSet.getInt("artistID");
                String artistName = resultSet.getString("artist_name");
                String description = resultSet.getString("short_description");
                String managementCompany = resultSet.getString("artist_management_company");
                Date birthDate = resultSet.getDate("birth_date");

                Artist artist = new Artist(artistID, artistName, description, managementCompany, birthDate);
                artists.add(artist);
            }

            return artists;
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
        }
    }

    public static void main(String[] args) {
        // Database connection details
        String url = "jdbc:mysql://localhost:3307/musicdb?useSSL=false";
        String username = "root";
        String password = "";

        try {
            // Create a database connection
            Connection connection = DriverManager.getConnection(url, username, password);

            // Create a Helper instance
            Helper helper = new Helper(connection);

            // Test retrieving a song by its ID
            int songID = 1;
            Song song = helper.getSongByID(songID);

            if (song != null) {
                System.out.println("Song ID: " + song.getSongID());
                System.out.println("Length: " + song.getLength());
                System.out.println("Genres: " + song.getGenres());
                System.out.println("Artists: " + song.getArtists().get(0).getNames());
                System.out.println("Release Date: " + song.getReleaseDate());
                System.out.println("Lyrics: " + song.getLyrics());
            } else {
                System.out.println("Song not found");
            }

            // Close the database connection
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}