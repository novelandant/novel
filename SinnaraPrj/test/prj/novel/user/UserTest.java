package prj.novel.user;

import static org.junit.Assert.*;

import org.junit.Test;

import prj.novel.logininput.Database;

public class UserTest {
	public static User TEST_USER = new  User("jingug1004", "DavidGuetta", "1111", "jingug1004@naver.com");
	
	
	@Test
	public void matchPassword() {
		User user = new  User("jingug1004", "DavidGuetta", "1111", "jingug1004@naver.com");
		
		boolean result = user.matchPassword("1111");
		assertTrue(result);
		
		// User user = new  User("jingug1004", "DavidGuetta", "1111", "jingug1004@naver.com");
		
		// boolean result = user.matchPassword("1111");
		// assertTrue(result);
	}

	@Test
	public void notMatchPassword() {
		
		assertFalse(TEST_USER.matchPassword("2222"));
		
		// User user = new  User("jingug1004", "DavidGuetta", "1111", "jingug1004@naver.com");
		// boolean result = user.matchPassword("bbb");
		// assertFalse(result);
	}
	
	@Test
	public void login() throws Exception {
		User user = UserTest.TEST_USER;
		Database.addUser(user);
		
		assertTrue(User.login(TEST_USER.getId(), TEST_USER.getPass()));
	}

	
	
	@Test(expected =  UserNotFoundException.class)
	public void loginWhenNotExistedUser() throws Exception {
			User.login("id2", TEST_USER.getPass());
	}

	
	
	@Test(expected =  PasswordMismatchException.class)
	public void loginWhenPasswordMismatch() throws Exception {
		
		User user = UserTest.TEST_USER;
		Database.addUser(user);
		
		User.login(TEST_USER.getId(), "pass2");
	}

}

















