package prj.novel.logininput;

import static org.junit.Assert.*;

import org.junit.Test;

import prj.novel.user.User;

public class DatabaseTest {

	@Test
	public void addAndFindWhenExisted() {
		User user = new User("aaa", "aaa", "aaa", "aaa@aaa.com");
		Database.addUser(user);
	
		User dbUser = Database.findByUserId(user.getId());
		assertEquals(user, dbUser);
	}

	public void addAndFindWhenNotExisted() {
		User dbUser = Database.findByUserId("id2");
		assertNull(dbUser);
	}
	
	

}
