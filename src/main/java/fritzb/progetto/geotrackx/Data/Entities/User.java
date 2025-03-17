package fritzb.progetto.geotrackx.Data.Entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import java.sql.Date;

@Entity
public class User {

    @Id
    private Integer userId;
    private String firstName;
    private String lastName;
    private String email;
    private Date birthdate;
    private Date creation_date;

}
