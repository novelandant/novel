package prj.novel.logininput;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

import prj.novel.user.User;
import prj.novel.user.UserTest;

public class DatabaseTest {

	@Test
	public void addAndFindWhenExisted() {
		User user = UserTest.TEST_USER;
		// 중복제거!
		//User user = new User("jingug1004", "DavidGuetta", "1111", "jingug1004@naver.com");
		
		Database.addUser(user);
	
		User dbUser = Database.findByUserId(user.getId());
		assertEquals(user, dbUser);
	}

	public void addAndFindWhenNotExisted() {
		User dbUser = Database.findByUserId("id2");
		assertNull(dbUser);
	}
	
	

}
