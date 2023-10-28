package org.openjfx.SoundCloud.base;

import java.util.Date;

public class Artist {
    private int artistID;
    private String names;
    private String description;
    private String managementCompany;
    private Date birthDate;

    // Constructors, getters, and setters

    public Artist(int artistID, String names, String description, String managementCompany, Date birthDate) {
        this.artistID = artistID;
        this.names = names;
        this.description = description;
        this.managementCompany = managementCompany;
        this.birthDate = birthDate;
    }

    public int getArtistID() {
        return artistID;
    }

    public void setArtistID(int artistID) {
        this.artistID = artistID;
    }

    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getManagementCompany() {
        return managementCompany;
    }

    public void setManagementCompany(String managementCompany) {
        this.managementCompany = managementCompany;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }
}
