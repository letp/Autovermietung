/** Peter */

import java.io.Serializable;

@SuppressWarnings("serial")
public class Account implements Serializable{
    
    private long id;
    private String name;
    private String vorname;
    private String passwort;
    private String passwort2;
    private String strasse;
    private String hnr;
    private String email;
    private String stadt;
    private String plz;
    
    
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getVorname() {
        return vorname;
    }
    public void setVorname(String vorname) {
        this.vorname = vorname;
    }
    public String getPasswort() {
        return passwort;
    }
    public void setPasswort(String passwort) {
        this.passwort = passwort;
    }
    public String getStrasse() {
        return strasse;
    }
    public void setStrasse(String strasse) {
        this.strasse = strasse;
    }
    public String getHnr() {
        return hnr;
    }
    public void setHnr(String string) {
        this.hnr = string;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getStadt() {
        return stadt;
    }
    public void setStadt(String stadt) {
        this.stadt = stadt;
    }
    public String getPlz() {
        return plz;
    }
    public void setPlz(String plz) {
        this.plz = plz;
    }
    public String getPasswort2() {
        return passwort2;
    }
    public void setPasswort2(String passwort2) {
        this.passwort2 = passwort2;
    }
    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
}
