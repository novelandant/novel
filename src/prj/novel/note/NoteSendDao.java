package prj.novel.note;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NoteSendDao {
	private Connection con;
	private PreparedStatement pstmt;
	private CallableStatement cStmt;
	private ResultSet rs;
	private DataSource ds;
	
	public NoteSendDao(){
		try{
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysqlDB");
		}

		catch(Exception err){
			System.out.println("DB���� ���� : " + err);
		}
	}

	public void freeConnection(){
		if(rs != null){try{rs.close();}catch(Exception err){}}
		if(pstmt != null){try{pstmt.close();}catch(Exception err){}}
		if(con != null){try{con.close();}catch(Exception err){}}
	}
	
	// ���� �޼��� ����Ʈ ��ȸ
	public ArrayList getNoteSendList(String pageGubun, String loginID){
		ArrayList list = new ArrayList();
		String sql= "";

		switch (pageGubun) {
			case "send":
				sql = "select * from note2_send where note2_keepyn = 'N' and note2_sendid = ? order by note2_regdate desc";
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
				NoteSendDto dto = new NoteSendDto();
				
				dto.setNote2_content(rs.getString("Note2_content"));
				dto.setNote2_getdate(rs.getString("Note2_getdate"));
				
				if (rs.getString("Note2_getidentify").equals("Y")) {
					dto.setNote2_getidentify("����");
				} 
				else {
					dto.setNote2_getidentify("�̼���");
				}
				dto.setNote2_keepyn(rs.getString("Note2_keepyn"));
				dto.setNote2_receiveid(rs.getString("Note2_receiveid"));
				dto.setNote2_regdate(rs.getString("Note2_regdate"));
				dto.setNote2_sendid(rs.getString("Note2_sendid"));
				dto.setNote2_sendnum(rs.getInt("Note2_sendnum"));
				dto.setNote2_subject(rs.getString("Note2_subject"));
				
				list.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getNoteSendList(" + pageGubun + "," + loginID + " ) : " + err);
		}
		finally{
			freeConnection();
		}
		return list;
	}

	
	// ���� �޼��� �� ��ȸ
	public NoteSendDto getNoteSendBySendNum(int getNum, String page){
		String sql = null;
		int sendNum = 0; 
		NoteSendDto noteDto = new NoteSendDto();

		try{
			con = ds.getConnection();
			
			sql = "SELECT NOTE2_SENDNUM, NOTE2_SUBJECT, NOTE2_CONTENT, NOTE2_REGDATE, NOTE2_RECEIVEID, " + 
					"		NOTE2_SENDID, NOTE2_GETIDENTIFY, IFNULL(NOTE2_GETDATE,'1999/01/01') NOTE2_GETDATE, " + 
					"		NOTE2_KEEPYN FROM NOTE2_SEND WHERE note2_sendnum = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getNum);

			rs = pstmt.executeQuery();

			if(rs.next()){
				noteDto.setNote2_content(rs.getString("Note2_content"));
				noteDto.setNote2_getdate(rs.getString("Note2_getdate"));
				
				if (rs.getString("Note2_getidentify").equals("Y")) {
					noteDto.setNote2_getidentify("����");
				} 
				else {
					noteDto.setNote2_getidentify("�̼���");
				}
				noteDto.setNote2_keepyn(rs.getString("Note2_keepyn"));
				noteDto.setNote2_receiveid(rs.getString("Note2_receiveid"));
				noteDto.setNote2_regdate(rs.getString("Note2_regdate"));
				noteDto.setNote2_sendid(rs.getString("Note2_sendid"));
				noteDto.setNote2_sendnum(rs.getInt("Note2_sendnum"));
				noteDto.setNote2_subject(rs.getString("Note2_subject"));	
			}
		}
		catch(Exception err){
			System.out.println("getNoteSendBySendNum() : " + err);
		}
		finally{
			freeConnection();
		}
		return noteDto;
	}
	
	// �޼��� ����
	// msgGubun('SEND':�����޼�����)
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
			System.out.println("writeMessage : " + err);
		} finally {
			freeConnection();
		}
		
		return iResult;
	}

	// �޼��� ����
	public int keepMessage(int msgNum) {
		int iResult = 0;
		
		try {
			con = ds.getConnection();
			
			cStmt = con.prepareCall("{call usp_keepMessage(?,?)}");
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
	
}
