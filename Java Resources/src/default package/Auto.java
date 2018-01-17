import java.io.Serializable;

public class Auto implements Serializable{

    private static final long serialVersionUID = 1L;
    private int id;
    private String marke;
    private String modell;
    private String kraftstoff;
    private String getriebe;
    private String ps;
    private String karosserie;
    private String erstzulassung;
    private int tueren;
    private int sitzplaetze;
    private double preis;
    private int vermieterid;
    private int mieterid;    
    private String Standort;
    private byte[] bild;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getMarke() {
        return marke;
    }
    public void setMarke(String marke) {
        this.marke = marke;
    }
    public String getModell() {
        return modell;
    }
    public void setModell(String modell) {
        this.modell = modell;
    }
    public String getKraftstoff() {
        return kraftstoff;
    }
    public void setKraftstoff(String kraftstoff) {
        this.kraftstoff = kraftstoff;
    }
    public String getGetriebe() {
        return getriebe;
    }
    public void setGetriebe(String getriebe) {
        this.getriebe = getriebe;
    }
    public String getPs() {
        return ps;
    }
    public void setPs(String ps) {
        this.ps = ps;
    }
    public String getKarosserie() {
        return karosserie;
    }
    public void setKarosserie(String karosserie) {
        this.karosserie = karosserie;
    }
    public String getErstzulassung() {
        return erstzulassung;
    }
    public void setErstzulassung(String erstzulassung) {
        this.erstzulassung = erstzulassung;
    }
    public int getTueren() {
        return tueren;
    }
    public void setTueren(int tueren) {
        this.tueren = tueren;
    }
    public int getSitzplaetze() {
        return sitzplaetze;
    }
    public void setSitzplaetze(int sitzplaetze) {
        this.sitzplaetze = sitzplaetze;
    }
    public double getPreis() {
        return preis;
    }
    public void setPreis(double preis) {
        this.preis = preis;
    }
    public int getVermieterid() {
        return vermieterid;
    }
    public void setVermieterid(int vermieterid) {
        this.vermieterid = vermieterid;
    }
    public int getMieterid() {
        return mieterid;
    }
    public void setMieterid(int mieterid) {
        this.mieterid = mieterid;
    }
    public String getStandort() {
        return Standort;
    }
    public void setStandort(String standort) {
        Standort = standort;
    }
    public byte[] getBild() {
        return bild;
    }
    public void setBild(byte[] bild) {
        this.bild = bild;
    }
    
    
}
