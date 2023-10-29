package org.openjfx.SoundCloud;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.openjfx.SoundCloud.base.Artist;
import org.openjfx.SoundCloud.base.Playlist;
import org.openjfx.SoundCloud.base.Song;
import org.openjfx.SoundCloud.base.User;

public class Helper {

    private static String url = "jdbc:mysql://localhost:3307/music_application?useSSL=false";
    private static String username = "root";
    private static String password = "";
    private static Connection connection;
    public static User currentUser = new User();// just for temporary

    static {
        try {
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static User getUserByID(int userID) {
        User user = null;

        String query = "SELECT username, email FROM Users WHERE userID = ?";
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            statement = connection.prepareStatement(query);
            statement.setInt(1, userID);

            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String username = resultSet.getString("username");
                user = new User(userID, username);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return user;
    }

    public static int getUserIdFromEmail(String email) {
        int userId = -1; // Default value if no matching user is found

        String query = "SELECT * FROM Users WHERE email = ?";
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, email);

            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                userId = resultSet.getInt("userID");
            } else {
                System.out.println("No user found with the given email.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return userId;
    }

    public static boolean checkPassword(String email, String inputPassword) {
        String query = "SELECT * FROM Users WHERE email = ?";
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        String correctPassword = "";
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, email);

            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                correctPassword = resultSet.getString("password");
                return inputPassword.equals(correctPassword);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return false;
    }

    public static Song getSongByID(int songID) throws SQLException {
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
                String name = resultSet.getString("name");
                List<String> genres = getGenresForSong(songID);
                List<Artist> artists = getArtistsForSong(songID);
                Date releaseDate = resultSet.getDate("released_date");
                String lyrics = resultSet.getString("lyrics");

                song = new Song(songID, name, length, genres, artists, releaseDate, lyrics);
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

    private static List<String> getGenresForSong(int songID) throws SQLException {
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

    private static List<Artist> getArtistsForSong(int songID) throws SQLException {
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

    public static List<Playlist> getPlaylistByUserID(int userID) {
        String userPlaylistQuery = "SELECT * FROM playlists WHERE userID = ?";
        String playlistSongsQuery = "SELECT s.songID, s.name, s.length_minutes, s.released_date, s.lyrics FROM Song_Playlist sp JOIN Songs s ON sp.songID = s.songID WHERE sp.playlistID = ?";
        PreparedStatement userPlaylistStatement = null;
        PreparedStatement playlistSongsStatement = null;
        ResultSet userPlaylistResultSet = null;
        ResultSet playlistSongsResultSet = null;

        List<Playlist> playlists = new ArrayList<>();

        try {
            // Retrieve user playlists
            userPlaylistStatement = connection.prepareStatement(userPlaylistQuery);
            userPlaylistStatement.setInt(1, userID);
            userPlaylistResultSet = userPlaylistStatement.executeQuery();

            while (userPlaylistResultSet.next()) {
                Playlist newPlaylist = new Playlist();
                newPlaylist.setPlaylistID(userPlaylistResultSet.getInt("playlistID"));
                newPlaylist.setName(userPlaylistResultSet.getString("name"));

                // Retrieve songs for the playlist
                playlistSongsStatement = connection.prepareStatement(playlistSongsQuery);
                playlistSongsStatement.setInt(1, newPlaylist.getPlaylistID());
                playlistSongsResultSet = playlistSongsStatement.executeQuery();

                while (playlistSongsResultSet.next()) {
                    int songID = playlistSongsResultSet.getInt("songID");
                    newPlaylist.addSong(getSongByID(songID));
                }
                playlists.add(newPlaylist);

            }

            return playlists;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (userPlaylistResultSet != null) {
                    userPlaylistResultSet.close();
                }
                if (playlistSongsResultSet != null) {
                    playlistSongsResultSet.close();
                }
                if (userPlaylistStatement != null) {
                    userPlaylistStatement.close();
                }
                if (playlistSongsStatement != null) {
                    playlistSongsStatement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return null; // Return null in case of any errors
    }

    public static void main(String[] args) {

        // Test reading user playlists and songs
        String email = "john@example.com";
        String password = "password123";

        boolean signInSuccess = checkPassword(email, password);
        if (signInSuccess) {
            System.out.println("Sign-in successful!");
            User user = getUserByID(getUserIdFromEmail(email));
            System.out.println(user.getUsername());
        } else {
            System.out.println("Invalid email or password. Sign-in failed.");

        }
    }

}