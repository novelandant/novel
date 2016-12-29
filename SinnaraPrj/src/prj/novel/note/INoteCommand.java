package prj.novel.note;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface INoteCommand {
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp);
}
