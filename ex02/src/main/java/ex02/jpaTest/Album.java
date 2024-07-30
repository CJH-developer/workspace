package ex02.jpaTest;

import javax.persistence.Entity;

@Entity
public class Album extends Item {
	
	private String artist;

	
	
	// getter setter
	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}
	
	
}
