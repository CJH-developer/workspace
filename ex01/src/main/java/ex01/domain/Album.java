package ex01.domain;

import javax.persistence.Entity;

@Entity
public class Album  extends Item{

	private String artist;
	private String etc;
	
	
	// getter setter
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	
	
}
