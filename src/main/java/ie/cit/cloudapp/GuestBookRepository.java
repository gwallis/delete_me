package ie.cit.cloudapp;

import java.util.ArrayList;
import java.util.List;

public class GuestBookRepository {
	private List<GuestBook> gbEntries = new ArrayList<GuestBook>();

	public List<GuestBook> getGbEntries() {
		return gbEntries;
	}
	
	public void addEntry(GuestBook entry) {
			gbEntries.add(entry);
	}

}
