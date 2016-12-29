package prj.novel.logininput;

import java.util.*;

import prj.novel.user.User;

public class Database {
	private static Map<String, User>users = new HashMap<>();
	
	public static void addUser(User user) {
		users.put(user.getId(), user);
		
		
	}

	public static User findByUserId(String id) {
		return users.get(id);
	}

	public static User findByUserEmail(String email) {
		return users.get(email);
	}
}
