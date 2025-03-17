package fritzb.progetto.geotrackx.Data.Entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Place {
    @Id
    private Integer id;
    private String coords;
    private String place_name;
    private String place_description;
    private String image;

    @ManyToOne
    @JoinColumn(name = "userId")
    private String Id;

}
