import java.io.Serializable;

public class Auto implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private String marke;
	private String modell;
	private String typ;
	private String kraftstoff;
	private String getriebe;
	private int ps;
	private String karroserie;
	private Standort standort;
	
	public Auto() {
		
	}
	
	public Auto(String marke) {
		super();
		this.marke = marke;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getKarroserie() {
		return karroserie;
	}
	
	public void setKarroserie(String karroserie) {
		this.karroserie = karroserie;
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
	public String getTyp() {
		return typ;
	}
	public void setTyp(String typ) {
		this.typ = typ;
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
	public int getPs() {
		return ps;
	}
	public void setPs(int ps) {
		this.ps = ps;
	}	
	public Standort getStandort() {
		return standort;
	}
	
	public void setStandort(Standort standort) {
		this.standort = standort;
	}
	
}
