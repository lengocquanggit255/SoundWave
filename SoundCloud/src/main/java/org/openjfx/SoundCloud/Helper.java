package org.openjfx.SoundCloud;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.openjfx.SoundCloud.base.Artist;
import org.openjfx.SoundCloud.base.Playlist;
import org.openjfx.SoundCloud.base.Song;
import org.openjfx.SoundCloud.base.User;

public class Helper {

    private static String url = "jdbc:mysql://localhost:3307/music_application?useSSL=false";
    private static String username = "root";
    private static String password = "";
    private static Connection connection;
    static {
        try {
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static User currentUser = new User();// just for temporary

    public static Playlist allSong = getAllSongs();

    public static List<Integer> removedPlaylists = new ArrayList<Integer>();// Track removedPlaylists
    public static List<Playlist> addedPlaylists = new ArrayList<Playlist>();// Track addedPlaylists

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

    public static Playlist getAllSongs() {
        Playlist allSong = new Playlist();// Special song that contains all songs and have no name, no id

        try {
            // Execute SQL query to fetch all songs from the database
            String query = "SELECT * FROM Songs";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            // Iterate through the result set and create Song objects
            while (resultSet.next()) {
                int songID = resultSet.getInt("songID");
                int length = resultSet.getInt("length_minutes");
                String name = resultSet.getString("name");
                List<String> genres = getGenresForSong(songID);
                List<Artist> artists = getArtistsForSong(songID);
                Date releaseDate = resultSet.getDate("released_date");
                String lyrics = resultSet.getString("lyrics");

                Song song = new Song(songID, name, length, genres, artists, releaseDate, lyrics);
                // Set other song attributes

                // Add the song to the list
                allSong.getSongs().add(song);
            }

            // Close the result set and statement
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return allSong;
    }

    public static void insertPlaylist(int userID, String playlistName) {

        String query = "INSERT INTO playlist (user_id, playlist_name) VALUES (?, ?)";
        PreparedStatement statement;
        try {
            statement = connection.prepareStatement(query);
            statement.setInt(1, userID);
            statement.setString(2, playlistName);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Playlist inserted successfully.");

    }

    public static int getHighestPlaylistID() {
        String query = "SELECT MAX(playlistID) FROM playlists";
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getInt(1);
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

        return -1; // Return -1 if no playlistID is found or an error occurs
    }

    public static void saveUserDataToDatabase() {
        addPlaylists();
        removePlaylists();
        addSongsToPlaylists();
        removeNonExistentPairsByPlaylist();
    }

    private static void addPlaylists() {
        if (addedPlaylists == null || addedPlaylists.isEmpty()) {
            return;
        }
        for (Playlist playlist : addedPlaylists) {
            try {
                // Get the playlistID and name from the playlist object
                int playlistID = playlist.getPlaylistID();
                int userID = currentUser.getUserID();
                String playlistName = playlist.getName();

                // Construct the SQL query to insert the new playlist into the playlists table
                String insertQuery = "INSERT INTO playlists (playlistID, userID, name) VALUES (?, ?, ?)";

                // Create a prepared statement with the insert query
                PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
                preparedStatement.setInt(1, playlistID);
                preparedStatement.setInt(2, userID);
                preparedStatement.setString(3, playlistName);

                // Execute the prepared statement to insert the new playlist
                int rowsAffected = preparedStatement.executeUpdate();
                System.out.println(rowsAffected + " playlist(s) added to the database.");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private static void removeNonExistentPairsByPlaylist() {
        for (Playlist playlist : currentUser.getPlaylists()) {
            try {
                int playlistID = playlist.getPlaylistID();

                // Get the list of songIDs in the given playlist
                List<Integer> songIDs = new ArrayList<>();
                for (Song song : playlist.getSongs()) {
                    int songID = song.getSongID();
                    songIDs.add(songID);
                }
                if (!songIDs.isEmpty()) {
                    // Construct the SQL query to remove non-existent pairs from the song_playlist
                    // table for the given playlistID
                    String deleteQuery = "DELETE FROM song_playlist WHERE playlistID = " + playlistID +
                            " AND songID NOT IN ("
                            + String.join(",", songIDs.stream().map(String::valueOf).collect(Collectors.toList()))
                            + ")";

                    // Execute the delete query to remove the non-existent pairs
                    Statement statement = connection.createStatement();
                    int rowsAffected = statement.executeUpdate(deleteQuery);
                    System.out.println(
                            rowsAffected + " non-existent pair(s) removed from song_playlist table for playlistID: "
                                    + playlistID);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private static void addSongsToPlaylists() {
        for (Playlist playlist : currentUser.getPlaylists()) {
            for (Song song : playlist.getSongs()) {
                try {
                    PreparedStatement preparedStatement = connection.prepareStatement(
                            "SELECT COUNT(*) AS count FROM song_playlist WHERE songID = ? AND playlistID = ?");
                    preparedStatement.setInt(1, song.getSongID());
                    preparedStatement.setInt(2, playlist.getPlaylistID());
                    ResultSet resultSet = preparedStatement.executeQuery();

                    if (resultSet.next() && resultSet.getInt("count") == 0) {
                        // The pair (songID, playlistID) does not exist, so add it to the database
                        PreparedStatement insertStatement = connection.prepareStatement(
                                "INSERT INTO song_playlist (songID, playlistID) VALUES (?, ?)");
                        insertStatement.setInt(1, song.getSongID());
                        insertStatement.setInt(2, playlist.getPlaylistID());
                        insertStatement.executeUpdate();
                        System.out.println("New pair added to the database.");
                    } else {
                        System.out.println("Pair already exists in the database.");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private static void removePlaylists() {
        if (removedPlaylists == null || removedPlaylists.isEmpty()) {
            return;
        }
        String playlistIds = removedPlaylists.stream()
                .map(String::valueOf)
                .collect(Collectors.joining(","));

        if (playlistIds.isEmpty()) {
            return;
        }

        // Construct the SQL query to delete the playlists from song_playlist table
        String deleteQueryInSong_PlaylistTable = "DELETE FROM song_playlist WHERE playlistID IN (" + playlistIds + ")";
        try {
            // Create a statement and execute the delete query
            Statement statement = connection.createStatement();
            int rowsAffected = statement.executeUpdate(deleteQueryInSong_PlaylistTable);

            System.out.println(rowsAffected + " row(s) removed in song_playlist table.");
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Construct the SQL query to delete the playlists from playlists table
        String deleteQueryInPlaylistTable = "DELETE FROM playlists WHERE playlistID IN (" + playlistIds + ")";
        try {
            // Create a statement and execute the delete query
            Statement statement = connection.createStatement();
            int rowsAffected = statement.executeUpdate(deleteQueryInPlaylistTable);

            System.out.println(rowsAffected + " row(s) removed in playlist table.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Playlist> getPlaylistOfAdmin() {
        int userID = 1;
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

    public static Playlist searchSongsByName(String songName) {
        Playlist matchingSongs = new Playlist();

        try {
            // Construct the SQL query to search for songs similar to the input
            String query = "SELECT * FROM Songs WHERE name LIKE ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, "%" + songName + "%");

            // Execute the query and retrieve the result set
            ResultSet resultSet = statement.executeQuery();

            // Iterate through the result set and create Song objects for matching songs
            while (resultSet.next()) {
                int songID = resultSet.getInt("songID");
                int length = resultSet.getInt("length_minutes");
                List<String> genres = getGenresForSong(songID);
                List<Artist> artists = getArtistsForSong(songID);
                Date releaseDate = resultSet.getDate("released_date");
                String lyrics = resultSet.getString("lyrics");

                Song song = new Song(songID, resultSet.getString("name"), length, genres, artists, releaseDate, lyrics);
                matchingSongs.addSong(song);
            }

            // Close the result set and statement
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return matchingSongs;
    }

    public static Playlist searchSongsByGenre(String genre) {
        Playlist songsByGenre = new Playlist(); // Special playlist that contains songs matching the genre

        try {
            // Execute SQL query to fetch songs by genre from the database
            String query = "SELECT songs.* FROM songs INNER JOIN songs_genres ON songs.songID = songs_genres.songID INNER JOIN genres ON songs_genres.genreID = genres.genreID WHERE genres.genre_name = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, genre);
            ResultSet resultSet = statement.executeQuery();

            // Iterate through the result set and create Song objects
            while (resultSet.next()) {
                int songID = resultSet.getInt("songID");
                int length = resultSet.getInt("length_minutes");
                String name = resultSet.getString("name");
                List<String> genres = getGenresForSong(songID);
                List<Artist> artists = getArtistsForSong(songID);
                Date releaseDate = resultSet.getDate("released_date");
                String lyrics = resultSet.getString("lyrics");

                Song song = new Song(songID, name, length, genres, artists, releaseDate, lyrics);
                // Set other song attributes

                // Add the song to the list
                songsByGenre.getSongs().add(song);
            }

            // Close the result set and statement
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return songsByGenre;
    }

    public static Playlist searchSongsByArtist(String artistName) {
        Playlist songsByArtist = new Playlist(); // Special playlist that contains songs by the artist

        try {
            // Execute SQL query to fetch songs by artist from the database
            String query = "SELECT songs.* FROM songs INNER JOIN songs_artists ON songs.songID = songs_artists.songID INNER JOIN artists ON songs_artists.artistID = artists.artistID WHERE artists.artist_name = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, artistName);
            ResultSet resultSet = statement.executeQuery();

            // Iterate through the result set and create Song objects
            while (resultSet.next()) {
                int songID = resultSet.getInt("songID");
                int length = resultSet.getInt("length_minutes");
                String name = resultSet.getString("name");
                List<String> genres = getGenresForSong(songID);
                List<Artist> artists = getArtistsForSong(songID);
                Date releaseDate = resultSet.getDate("released_date");
                String lyrics = resultSet.getString("lyrics");

                Song song = new Song(songID, name, length, genres, artists, releaseDate, lyrics);
                // Set other song attributes

                // Add the song to the list
                songsByArtist.getSongs().add(song);
            }

            // Close the result set and statement
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return songsByArtist;
    }

    public static Playlist searchSongsByReleasedDate(String dateString) {
        Playlist songsByReleasedDate = new Playlist(); // Special playlist that contains songs released on the specified
                                                       // date

        try {
            // Convert the input string to java.sql.Date
            java.sql.Date sqlDate = java.sql.Date.valueOf(dateString);
            // Execute SQL query to fetch songs by released date from the database
            String query = "SELECT * FROM Songs WHERE released_date = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setDate(1, sqlDate);
            ResultSet resultSet = statement.executeQuery();

            // Iterate through the result set and create Song objects
            while (resultSet.next()) {
                int songID = resultSet.getInt("songID");
                int length = resultSet.getInt("length_minutes");
                String name = resultSet.getString("name");
                List<String> genres = getGenresForSong(songID);
                List<Artist> artists = getArtistsForSong(songID);
                Date releaseDate = resultSet.getDate("released_date");
                String lyrics = resultSet.getString("lyrics");

                Song song = new Song(songID, name, length, genres, artists, releaseDate, lyrics);
                // Set other song attributes

                // Add the song to the list
                songsByReleasedDate.getSongs().add(song);
            }

            // Close the result set and statement
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return songsByReleasedDate;
    }

    public static void createUser(String userName, String password, String email) {
        String query = "INSERT INTO Users (username, password, email) VALUES (?, ?, ?)";
        PreparedStatement statement = null;

        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, userName);
            statement.setString(2, password);
            statement.setString(3, email);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static boolean isValidEmail(String email) {
        String query = "SELECT COUNT(*) FROM Users WHERE email = ?";
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean isValid = true;

        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, email);

            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                if (count > 0) {
                    isValid = false;
                    System.out.println("Email already exists in the database.");
                }
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

        return isValid;
    }

    // public static void main(String[] args) {

    // // Test reading user playlists and songs
    // String email = "john@example.com";
    // String password = "password123";

    // boolean signInSuccess = checkPassword(email, password);
    // if (signInSuccess) {
    // System.out.println("Sign-in successful!");
    // User user = getUserByID(getUserIdFromEmail(email));
    // System.out.println(user.getUsername());
    // } else {
    // System.out.println("Invalid email or password. Sign-in failed.");

    // }
    // }

}