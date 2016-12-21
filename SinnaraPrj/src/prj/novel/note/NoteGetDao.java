package prj.novel.note;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NoteGetDao {
	private Connection con;
	private PreparedStatement pstmt;
	private CallableStatement cStmt;
	private ResultSet rs;
	private DataSource ds;
	
	public NoteGetDao(){
		try{
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracleDB");
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
	
	// 받은 메세지 리스트 조회
	public ArrayList getNoteList(){
		ArrayList list = new ArrayList();

		String sql = "select * from note_get order by note_regdate desc";

		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()){
				NoteGetDto dto = new NoteGetDto();
				
				dto.setNote_getnum(rs.getInt("Note_getnum"));
				dto.setNote2_sendnum(rs.getInt("Note2_sendnum"));
				dto.setNote_subject(rs.getString("Note_subject"));
				dto.setNote_content(rs.getString("Note_content"));
				dto.setNote_regdate(rs.getString("Note_regdate"));
				dto.setNote_keepyn(rs.getString("Note_keepyn"));
				dto.setNote_sendid(rs.getString("Note_sendid"));
				dto.setNote_receiveid(rs.getString("Note_receiveid"));
				
				list.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getNoteList() : " + err);
		}
		finally{
			freeConnection();
		}
		return list;
	}

	public ArrayList getNoteList(String loginID){
		ArrayList list = new ArrayList();

		String sql = "select * from note_get where note_keepyn = 'N' and note_receiveid = ? order by note_regdate desc";

		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, loginID);
			rs = pstmt.executeQuery();

			while(rs.next()){
				NoteGetDto dto = new NoteGetDto();
				
				dto.setNote_getnum(rs.getInt("Note_getnum"));
				dto.setNote2_sendnum(rs.getInt("Note2_sendnum"));
				dto.setNote_subject(rs.getString("Note_subject"));
				dto.setNote_content(rs.getString("Note_content"));
				dto.setNote_regdate(rs.getString("Note_regdate"));
				dto.setNote_keepyn(rs.getString("Note_keepyn"));
				dto.setNote_sendid(rs.getString("Note_sendid"));
				dto.setNote_receiveid(rs.getString("Note_receiveid"));
				
				list.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getNoteList() : " + err);
		}
		finally{
			freeConnection();
		}
		return list;
	}

	// 메세지 리스트 조회
	public ArrayList getNoteList(String pageGubun, String loginID){
		ArrayList list = new ArrayList();
		String sql= "";

		switch (pageGubun) {
			case "receive":
				sql = "select * from note_get where note_keepyn = 'N' and note_receiveid = ? order by note_regdate desc";
				break;
			case "send":
				sql = "select * from note2_send where note2_keepyn = 'N' and note2_sendid = ? order by note2_regdate desc";
				break;
			case "r_store":
				sql = "select * from note_get where note_keepyn = 'Y' and note_receiveid = ? order by note_regdate desc";
				break;
			case "s_store":
				sql = "select * from note2_send where note2_keepyn = 'Y' and note2_sendid = ? order by note2_regdate desc";
				break;
		}

		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, loginID);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				NoteGetDto dto = new NoteGetDto();
				
				dto.setNote_getnum(rs.getInt("Note_getnum"));
				dto.setNote2_sendnum(rs.getInt("Note2_sendnum"));
				dto.setNote_subject(rs.getString("Note_subject"));
				dto.setNote_content(rs.getString("Note_content"));
				dto.setNote_regdate(rs.getString("Note_regdate"));
				dto.setNote_keepyn(rs.getString("Note_keepyn"));
				dto.setNote_sendid(rs.getString("Note_sendid"));
				dto.setNote_receiveid(rs.getString("Note_receiveid"));
				
				list.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getNoteList(" + pageGubun + "," + loginID + " ) : " + err);
		}
		finally{
			freeConnection();
		}
		return list;
	}
	
	// 받은 메세지 상세 조회
	public NoteGetDto getNoteByGetNum(int getNum, String page){
		String sql = null;
		int sendNum = 0; 
		NoteGetDto noteDto = new NoteGetDto();

		try{
			con = ds.getConnection();
			
			sql = "select * from note_get where note_getnum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getNum);

			rs = pstmt.executeQuery();

			if(rs.next()){
				noteDto.setNote_getnum(rs.getInt("Note_getnum"));
				sendNum = rs.getInt("Note2_sendnum");
				noteDto.setNote2_sendnum(sendNum);
				noteDto.setNote_subject(rs.getString("Note_subject"));
				noteDto.setNote_content(rs.getString("Note_content"));
				noteDto.setNote_regdate(rs.getString("Note_regdate"));
				noteDto.setNote_keepyn(rs.getString("Note_keepyn"));
				noteDto.setNote_sendid(rs.getString("Note_sendid"));
				noteDto.setNote_receiveid(rs.getString("Note_receiveid"));
			}
			
			// 수신정보 저장
			receiveConfirm(sendNum);
		}
		catch(Exception err){
			System.out.println("getNoteByGetNum() : " + err);
		}
		finally{
			freeConnection();
		}
		return noteDto;
	}
	
	// 수신 정보 저장
	public int receiveConfirm(int msgNum) {
		int iResult = 0;
		
		try {
			con = ds.getConnection();
			
			cStmt = con.prepareCall("{call usp_receiveConfirm(?,?)}");
			cStmt.setInt(1,  msgNum);
			cStmt.registerOutParameter(2, Types.NUMERIC);
				
			cStmt.execute();
			
			iResult = cStmt.getInt(2);
			
		} catch (SQLException err) {
			System.out.println("keepMessage : " + err);
		} finally {
			freeConnection();
		}
		
		return iResult;
	}
	
	// 메세지 보내기
	public int writeMessage(NoteGetDto noteDto) {
		int iResult = 0;

		try{
			con = ds.getConnection();
			
			cStmt = con.prepareCall("{call usp_insertNote(?,?,?,?,?,?)}");
			cStmt.setString(1, noteDto.getNote_subject());
			cStmt.setString(2, noteDto.getNote_content());
			cStmt.setString(3, noteDto.getNote_keepyn());
			cStmt.setString(4, noteDto.getNote_sendid());
			cStmt.setString(5, noteDto.getNote_receiveid());
			cStmt.registerOutParameter(6, Types.NUMERIC);
			
			cStmt.execute();
			
			iResult = cStmt.getInt(6);
			
		}
		catch(Exception err){
			System.out.println("writeMessage : " + err);
		}
		finally{
			freeConnection();
		}

		return iResult;
	}
	
	// 메세지 삭제
	// msgGubun('SEND':보낸메세지함)
	public int deleteNote(int msgNum, String msgGubun) {
		int iResult = 0;
		
		try {
			con = ds.getConnection();
			
			cStmt = con.prepareCall("{call usp_deleteMessage(?,?,?)}");
			cStmt.setInt(1,  msgNum);
			cStmt.setString(2, msgGubun);
			cStmt.registerOutParameter(3, Types.NUMERIC);
				
			cStmt.execute();
			iResult = cStmt.getInt(3);
			
		} catch (Exception err) {
			System.out.println("deleteNote : " + err);
		} finally {
			freeConnection();
		}
		
		return iResult;
	}

	// 메세지 보관
	// msgGubun('SEND':보낸메세지함)
	public int keepMessage(int msgNum, String msgGubun) {
		int iResult = 0;
		
		try {
			con = ds.getConnection();
			
			cStmt = con.prepareCall("{call usp_keepMessage(?,?,?)}");
			cStmt.setInt(1,  msgNum);
			cStmt.setString(2, msgGubun);
			cStmt.registerOutParameter(3, Types.NUMERIC);
				
			cStmt.execute();
			
			iResult = cStmt.getInt(3);
			
		} catch (SQLException err) {
			System.out.println("keepMessage : " + err);
		} finally {
			freeConnection();
		}
		
		return iResult;
	} 
	
	// 수신인 ID check
	public boolean isExistID(String sendID){
		String sql = null;
		boolean bExist = false;
		
		try{
			con = ds.getConnection();
			
			sql = "select * from member_info where member_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sendID);

			rs = pstmt.executeQuery();

			if(rs.next()){
				bExist = true;
			}
		}
		catch(Exception err){
			System.out.println("isExistID() : " + err);
		}
		finally{
			freeConnection();
		}
		return bExist;
	}

	// 
	public int getCountUnreadMessage(String receiveID){
		String sql = null;
		int rowCount = 0;
		
		try{
			con = ds.getConnection();
			
			sql = "select count(*) count from note2_send where note2_receiveid = ? and NOTE2_GETIDENTIFY = 'N'";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, receiveID);

			rs = pstmt.executeQuery();

			if(rs.next()){
				rowCount = rs.getInt("count");
			}
		}
		catch(Exception err){
			System.out.println("getCountUnreadMessage() : " + err);
		}
		finally{
			freeConnection();
		}
		return rowCount;
	}

}
