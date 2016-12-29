package prj.novel.registmember;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import prj.novel.itemshop.ItemShop_Dto;

public class Member_Dao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public Member_Dao(){
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
	
	public void insertMember_info(Member_Dto dto){
		// insert into ���̺�� (�÷��� ...) values(��);
		String sql = "insert into member_info(member_id,member_pass,member_email,member_name)"
				+ "values(?,?,?,?)";
		

		try{
			// DB ����
			con = ds.getConnection();
			
			
			// DB�� �� �ֱ�
			pstmt = con.prepareStatement(sql);
			//pstmt.setInt(1, dto.getSum());
			pstmt.setString(1, dto.getMember_id());
			pstmt.setString(2, dto.getMember_pass());
			pstmt.setString(3, dto.getMember_name());
			pstmt.setString(4, dto.getMember_email());
			
			
		
			
			// insert�� �� ���� 'pstmt.executeUpdate();' �ʿ� 
			pstmt.executeUpdate();
			// �������� ����
		}
		catch(Exception err){
			System.out.println("insertPur_History : " + err);
		}
		finally{
			freeConnection();
		}
	}
}
