package prj.novel.logininput;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import prj.novel.registmember.Member_Dto;

public class Login_Dao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public Login_Dao(){
		try{
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysqlDB");
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
	
	  public Member_Dto certify(String id) {
	         Member_Dto mdto = new Member_Dto();
	         String sql = "select member_pass from member_info where member_id=?";
	         try {
	            con = ds.getConnection();
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, id);
	            rs = pstmt.executeQuery();
	            
	            if (rs.next()) {
	               mdto.setMember_pass(rs.getString("member_pass"));
	               
	            }
	         } catch (Exception e) {
	            System.out.println("login() : " + e);
	         }
	         return mdto;
	      }

}
