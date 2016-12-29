package prj.novel.piece;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Piece_serially_DAO {
	Connection conn = null;
	PreparedStatement pstmt = null;

	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://192.168.1.236/mysqlDB";

	public void connect() {
		try {
			Class.forName(jdbc_driver);

			conn = DriverManager.getConnection(jdbc_url, "novel", "1111");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();

			}
		}
	}

	public boolean insertDB(Piece_serially_DTO dto) {
		connect();
		String sql = "insert into piece_serially(piece_smallsubject, piece_content, piece_epilogue) values(?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPiece_smallsubject());
			pstmt.setString(2, dto.getPiece_content());
			pstmt.setString(3, dto.getPiece_epilogue());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	public boolean updateDB(Piece_serially_DTO dto) {
		connect();

		String sql = "update piece_serially set piece_smallsubject=?, piece_content=?, piece_epilogue=? where piece_turnnum=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPiece_smallsubject());
			pstmt.setString(2, dto.getPiece_content());
			pstmt.setString(3, dto.getPiece_epilogue());
			pstmt.setInt(4, dto.getPiece_turnnum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;

	}

	public boolean deleteDB(int piece_turnnum) {
		connect();

		String sql = "delete from piece_serially where piece_turnnum=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, piece_turnnum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;

	}

	public Piece_serially_DTO getDB(int piece_turnnum, String page) {
		connect();
		
		String sql = null;
		Piece_serially_DTO dto = new Piece_serially_DTO();

		try {
			
			if(page.equals("read")){
				sql = "update piece_serially set b_count = b_count+1 where b_num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, piece_turnnum);
				pstmt.executeUpdate();
			
			}
			sql = "select * from piece_serially where piece_turnnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, piece_turnnum);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
			dto.setPiece_turnnum(rs.getInt("piece_turnnum"));
			dto.setPiece_smallsubject(rs.getString("piece_smallsubject"));
			dto.setPiece_content(rs.getString("piece_content"));
			dto.setPiece_epilogue(rs.getString("piece_epilogue"));
			rs.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return dto;
	}

	public ArrayList getDBList(String keyField, String keyWord) {
		connect();
		ArrayList<Piece_serially_DTO> datas = new ArrayList<Piece_serially_DTO>();
		String sql = null;
		
		//String sql = "select * from piece_serially order by piece_turnnum desc";
		
		
		if(keyWord == null || keyWord.isEmpty()){
			sql = "select * from piece_serially order by piece_turnnum"; //¼öÁ¤
		}else{
			sql = "select * from piece_serially where " + keyField
					+ " like '%" + keyWord + "%' order by piece_turnnum";
		}
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Piece_serially_DTO dto = new Piece_serially_DTO();

				dto.setPiece_turnnum(rs.getInt("piece_turnnum"));
				dto.setPiece_smallsubject(rs.getString("piece_smallsubject"));
				dto.setPiece_content(rs.getString("piece_content"));
				dto.setPiece_epilogue(rs.getString("piece_epilogue"));
				datas.add(dto);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;
	}

}
