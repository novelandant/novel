package prj.novel.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import oracle.jdbc.proxy.annotation.Pre;

public class BoardDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public BoardDao(){
		try{
			Context ctx = new InitialContext();
			// ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracleDB");
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysqlDB");
		}
		catch(Exception err){
			System.out.println("DB ?—°ê²°ì‹¤?Œ¨: " + err);
		}
	}
	
	public void freeConnection(){
		if(rs != null){try{rs.close();}catch(Exception err){}}
		if(pstmt != null){try{pstmt.close();}catch(Exception err){}}
		if(con != null){try{con.close();}catch(Exception err){}}
	}
	
	// ? „ì²? ì¡°íšŒ(List.jsp)
	public ArrayList getBoardList(String keyField, String keyWord){
		ArrayList list = new ArrayList();
		String sql = null;
		
		if(keyWord == null || keyWord.isEmpty()){
			sql = "select * from notice order by notice_pos";
		}
		else{
			sql = "select * from notice where " + keyField
				+ " like '%" + keyWord + "%' order by notice_pos";
		}
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardDto dto = new BoardDto();
				
				dto.setNotice_content(rs.getString("notice_content"));
				dto.setNotice_count(rs.getInt("notice_count"));
				dto.setNotice_depth(rs.getInt("notice_depth"));
				dto.setNotice_name(rs.getString("notice_name"));
				dto.setNotice_num(rs.getInt("notice_num"));
				dto.setNotice_pass(rs.getString("notice_pass"));
				dto.setNotice_pos(rs.getInt("notice_pos"));
				dto.setNotice_regdate(rs.getString("notice_regdate"));
				dto.setNotice_subject(rs.getString("notice_subject"));
				
				list.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getBoardList() : " + err);
		}
		finally{
			freeConnection();
		}
		
		return list;
	}
	
	private void updatePos(Connection con){
		try{
			String sql = "update notice set notice_pos=notice_pos+1";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("updatePos : " + err);
		}
	}
	
	// ê¸??“°ê¸? (Post.jsp, Postproc.jsp)
	public void insertBoard(BoardDto dto){
		String sql = "insert into notice(notice_name, "
			+ "notice_subject, notice_content, "
			+ "notice_regdate, notice_pass, notice_count, notice_pos, "
			+ "notice_depth) values(?, ?, ?, "
			+ "now(), ?, 0, 0, 0)";
		
		try{
			con = ds.getConnection();
			
			updatePos(con);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getNotice_name());
			pstmt.setString(2, dto.getNotice_subject());
			pstmt.setString(3, dto.getNotice_content());
			pstmt.setString(4, dto.getNotice_pass());
			
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("insertBoard : " + err);
		}
		finally{
			freeConnection();
		}
	}
	
	// ?½ê³? ?ˆ˜? •?•˜ê¸? (Read.jsp, Update.jsp)
	public BoardDto getBoard(int num, String page){
		String sql = null;
		BoardDto dto = new BoardDto();
		
		try{
			con = ds.getConnection();
			
			if(page.equals("read")){
				sql = "update notice set notice_count=notice_count+1 where notice_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			}
			
			sql = "select * from notice where notice_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setNotice_content(rs.getString("notice_content"));
				dto.setNotice_count(rs.getInt("notice_count"));
				dto.setNotice_depth(rs.getInt("notice_depth"));
				dto.setNotice_name(rs.getString("notice_name"));
				dto.setNotice_num(rs.getInt("notice_num"));
				dto.setNotice_pass(rs.getString("notice_pass"));
				dto.setNotice_pos(rs.getInt("notice_pos"));
				dto.setNotice_regdate(rs.getString("notice_regdate"));
				dto.setNotice_subject(rs.getString("notice_subject"));
			}
		}
		catch(Exception err){
			System.out.println("getBoard() : " + err);
		}
		finally{
			freeConnection();
		}
		
		return dto;
	}
	
	// ?ˆ˜? •?•˜ê¸? (UpdateProc.jsp)
	public void updateBoard(BoardDto dto){
		String sql = "update notice set notice_name=?, "
				+ "notice_subject=?, notice_content=? where notice_num=?";
			
			try{
				con = ds.getConnection();
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getNotice_name());
				pstmt.setString(2, dto.getNotice_subject());
				pstmt.setString(3, dto.getNotice_content());
				pstmt.setInt(4, dto.getNotice_num());
				
				pstmt.executeUpdate();
			}
			catch(Exception err){
				System.out.println("updateBoard : " + err);
			}
			finally{
				freeConnection();
			}
	}
	
	// ?‚­? œ (Delete.jsp)
	public void deleteBoard(int num){
		String sql = "delete from notice where notice_num=?";
			
		try{
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("deleteBoard : " + err);
		}
		finally{
			freeConnection();
		}
	}
	
	//  ?‹µë³??‹¬ê¸?
	public void replyUpdatePos(BoardDto dto){
		try{
			String sql = "update notice set notice_pos=notice_pos+1 where notice_pos>?";
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getNotice_pos());
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("replyUpdatePos : " + err);
		}
		finally{
			freeConnection();
		}
	}
	
	// ?‹µë³??‹¬ê¸?
	public void replyBoard(BoardDto dto){
		String sql = "insert into notice(notice_name, "
				+ "notice_subject, notice_content, "
				+ "notice_regdate, notice_pass, notice_count, notice_pos, "
				+ "notice_depth) values(?, ?, ?,"
				+ "now(), ?, 0, ?, ?)";
			
		try{
			con = ds.getConnection();
			
			updatePos(con);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getNotice_name());
			pstmt.setString(2, dto.getNotice_subject());
			pstmt.setString(3, dto.getNotice_content());
			pstmt.setString(4, dto.getNotice_pass());
			pstmt.setInt(5, dto.getNotice_pos()+1);
			pstmt.setInt(6, dto.getNotice_depth()+1);
			
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("replyBoard : " + err);
		}
		finally{
			freeConnection();
		}
	}
	
	// ?‹µë³? ?“¤?—¬?“°ê¸?
	public String useDepth(int depth){
		String result = "";
		for(int i=0; i<depth*3; i++){
			result += "&nbsp;";
		}
		return result;
	}
}