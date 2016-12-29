package prj.novel.qna;

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
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysqlDB");
			// ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracleDB");
		}
		catch(Exception err){
			System.out.println("DB연결 실패 : " + err);
		}
	}
	
	public void freeConnection(){
		if(rs != null){try{rs.close();}catch(Exception err){}}
		if(pstmt != null){try{pstmt.close();}catch(Exception err){}}
		if(con != null){try{con.close();}catch(Exception err){}}
	}
	
	// 전체글 조회(List.jsp)
	public ArrayList getBoardList(String keyField, String keyWord){
		ArrayList list = new ArrayList();
		String sql = null;
		
		if(keyWord == null || keyWord.isEmpty()){
			sql = "select * from qnaboard order by qna_pos";
		}
		else{
			sql = "select * from qnaboard where " + keyField
				+ " like '%" + keyWord + "%' order by qna_pos";
		}
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardDto dto = new BoardDto();
				
				dto.setQna_content(rs.getString("qna_content"));
				dto.setQna_count(rs.getInt("qna_count"));
				dto.setQna_depth(rs.getInt("qna_depth"));
				dto.setQna_name(rs.getString("qna_name"));
				dto.setQna_num(rs.getInt("qna_num"));
				dto.setQna_pass(rs.getString("qna_pass"));
				dto.setQna_pos(rs.getInt("qna_pos"));
				dto.setQna_regdate(rs.getString("qna_regdate"));
				dto.setQna_subject(rs.getString("qna_subject"));
				
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
			String sql = "update qnaboard set qna_pos=qna_pos+1";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("updatePos : " + err);
		}
	}
	
	// 글쓰기(Post.jsp, Postproc.jsp)
	public void insertBoard(BoardDto dto){
		String sql = "insert into qnaboard(qna_name, "
			+ "qna_subject, qna_content, "
			+ "qna_regdate, qna_pass, qna_count, qna_pos, "
			+ "qna_depth) values(?,?,?, "
			+ "now(), ?, 0, 0, 0)";
		
		try{
			con = ds.getConnection();
			
			updatePos(con);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getQna_name());
			pstmt.setString(2, dto.getQna_subject());
			pstmt.setString(3, dto.getQna_content());
			pstmt.setString(4, dto.getQna_pass());

			
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("insertBoard : " + err);
		}
		finally{
			freeConnection();
		}
	}
	
	// 글읽기(Read.jsp, Update.jsp)
	public BoardDto getBoard(int num, String page){
		String sql = null;
		BoardDto dto = new BoardDto();
		
		try{
			con = ds.getConnection();
			
			if(page.equals("read")){
				sql = "update qnaboard set qna_count=qna_count+1 where qna_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			}
			
			sql = "select * from qnaboard where qna_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setQna_content(rs.getString("qna_content"));
				dto.setQna_count(rs.getInt("qna_count"));
				dto.setQna_depth(rs.getInt("qna_depth"));
				dto.setQna_name(rs.getString("qna_name"));
				dto.setQna_num(rs.getInt("qna_num"));
				dto.setQna_pass(rs.getString("qna_pass"));
				dto.setQna_pos(rs.getInt("qna_pos"));
				dto.setQna_regdate(rs.getString("qna_regdate"));
				dto.setQna_subject(rs.getString("qna_subject"));
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
	
	// 글 수정(UpdateProc.jsp)
	public void updateBoard(BoardDto dto){
		String sql = "update qnaboard set qna_name=?, "
				+ "qna_subject=?, qna_content=? where qna_num=?";
			
			try{
				con = ds.getConnection();
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getQna_name());
				pstmt.setString(3, dto.getQna_subject());
				pstmt.setString(4, dto.getQna_content());
				pstmt.setInt(5, dto.getQna_num());
				
				pstmt.executeUpdate();
			}
			catch(Exception err){
				System.out.println("updateBoard : " + err);
			}
			finally{
				freeConnection();
			}
	}
	
	// 글 삭제(Delete.jsp)
	public void deleteBoard(int num){
		String sql = "delete from qnaboard where qna_num=?";
			
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
	
	// 답변 달기전 부모글의 pos보다 큰 pos를 1 증가 시키기 위한 메서드
	public void replyUpdatePos(BoardDto dto){
		try{
			String sql = "update qnaboard set qna_pos=qna_pos+1 where qna_pos>?";
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getQna_pos());
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("replyUpdatePos : " + err);
		}
		finally{
			freeConnection();
		}
	}
	
	// 답변 달기
	public void replyBoard(BoardDto dto){
		String sql = "insert into qnaboard(qna_num, qna_name, "
				+ "qna_subject, qna_content, "
				+ "qna_regdate, qna_pass, qna_count, qna_pos, "
				+ "qna_depth) values(seq_qna_num.nextVal, ?,?,?, "
				+ "now(), ?, 0, ?, ?)";
			
		try{
			con = ds.getConnection();
			
			updatePos(con);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getQna_name());
			pstmt.setString(4, dto.getQna_subject());
			pstmt.setString(5, dto.getQna_content());
			pstmt.setString(6, dto.getQna_pass());
			pstmt.setInt(8, dto.getQna_pos()+1);
			pstmt.setInt(9, dto.getQna_depth()+1);
			
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("replyBoard : " + err);
		}
		finally{
			freeConnection();
		}
	}
	
	// 들여쓰기
	public String useDepth(int depth){
		String result = "";
		for(int i=0; i<depth*3; i++){
			result += "&nbsp;";
		}
		return result;
	}
}