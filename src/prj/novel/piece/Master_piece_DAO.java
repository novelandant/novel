package prj.novel.piece;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Master_piece_DAO {
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

	public boolean insertDB(Master_piece_DTO dto) {
		connect();
		String sql = "insert into master_piece " + "(master_kindcode, master_fendencycode, "
				+ "master_bigcategory, master_smallcategory, master_pieceintroduce,"
				+ "master_keyword, master_imageroute, master_piece, master_reviewavailyn, "
				+ "master_commentavailyn, master_evalavailyn) values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMaster_kindcode());
			pstmt.setString(2, dto.getMaster_fendencycode());
			pstmt.setString(3, dto.getMaster_bigcategory());
			pstmt.setString(4, dto.getMaster_smallcategory());
			pstmt.setString(5, dto.getMaster_pieceintroduce());
			pstmt.setString(6, dto.getMaster_keyword());
			pstmt.setString(7, dto.getMaster_imageroute());
			pstmt.setString(8, dto.getMaster_piece());
			pstmt.setString(9, dto.getMaster_reviewavailyn());
			pstmt.setString(10, dto.getMaster_commentavailyn());
			pstmt.setString(11, dto.getMaster_evalavailyn());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	public boolean updateDB(Master_piece_DTO dto) {
		connect();

		String sql = "update addrbook set master_kindcode=?, master_fendencycode=?, "
				+ "master_bigcategory=?, master_smallcategory=?, master_pieceintroduce=?, "
				+ "master_keyword=?, master_imageroute=?, master_piece=?, master_reviewavailyn=?, "
				+ "master_commentavailyn=?, master_evalavailyn=?) where master_piecenum=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMaster_kindcode());
			pstmt.setString(2, dto.getMaster_fendencycode());
			pstmt.setString(3, dto.getMaster_bigcategory());
			pstmt.setString(4, dto.getMaster_smallcategory());
			pstmt.setString(5, dto.getMaster_pieceintroduce());
			pstmt.setString(6, dto.getMaster_keyword());
			pstmt.setString(7, dto.getMaster_imageroute());
			pstmt.setString(8, dto.getMaster_piece());
			pstmt.setString(9, dto.getMaster_reviewavailyn());
			pstmt.setString(10, dto.getMaster_commentavailyn());
			pstmt.setString(11, dto.getMaster_evalavailyn());
			pstmt.setInt(12, dto.getMaster_piecenum());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	// 특정 주소록 게시글 삭제 메서드
	public boolean deleteDB(int master_piecenum) {
		connect();
		String sql = "delete from master_piece where master_piecenum=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, master_piecenum);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	public Master_piece_DTO getDB(int master_piecenum, String page) {
		connect();

		String sql = null;
		Master_piece_DTO dto = new Master_piece_DTO();

		try {

			if (page.equals("read")) { // 조회수
				sql = "update master_piece set b_count = b_count+1 where b_num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, master_piecenum);
				pstmt.executeUpdate();
			}

			sql = "select * from master_piece where master_piecenum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, master_piecenum);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setMaster_piecenum(rs.getInt("master_piecenum"));
				dto.setMaster_piece(rs.getString("master_piece"));
				dto.setMaster_kindcode(rs.getString("master_kindcode"));
				dto.setMaster_fendencycode(rs.getString("master_fendencycode"));
				dto.setMaster_bigcategory(rs.getString("master_bigcategory"));
				dto.setMaster_smallcategory(rs.getString("master_smallcategory"));
				dto.setMaster_pieceintroduce(rs.getString("master_pieceintroduce"));
				dto.setMaster_keyword(rs.getString("master_keyword"));
				dto.setMaster_imageroute(rs.getString("master_imageroute"));
				dto.setMaster_reviewavailyn(rs.getString("master_reviewavailyn"));
				dto.setMaster_commentavailyn(rs.getString("master_commentavailyn"));
				dto.setMaster_evalavailyn(rs.getString("master_evalavailyn"));
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return dto;
	}

	public ArrayList<Master_piece_DTO> getDBList(String keyField, String keyWord) {
		connect();
		ArrayList<Master_piece_DTO> datas = new ArrayList<Master_piece_DTO>();
		String sql = null;
		
		if(keyWord == null || keyWord.isEmpty()){
			sql = "select * from master_piece order by master_piecenum"; 
		}else{
			sql = "select * from master_piece where " + keyField
					+ " like '%" + keyWord + "%' order by master_piecenum";
		}
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Master_piece_DTO dto = new Master_piece_DTO();

				dto.setMaster_piecenum(rs.getInt("master_piecenum"));
				dto.setMaster_piece(rs.getString("master_piece"));
				dto.setMaster_kindcode(rs.getString("master_kindcode"));
				dto.setMaster_fendencycode(rs.getString("master_fendencycode"));
				dto.setMaster_bigcategory(rs.getString("master_bigcategory"));
				dto.setMaster_smallcategory(rs.getString("master_smallcategory"));
				dto.setMaster_pieceintroduce(rs.getString("master_pieceintroduce"));
				dto.setMaster_keyword(rs.getString("master_keyword"));
				dto.setMaster_imageroute(rs.getString("master_imageroute"));
				dto.setMaster_reviewavailyn(rs.getString("master_reviewavailyn"));
				dto.setMaster_commentavailyn(rs.getString("master_commentavailyn"));
				dto.setMaster_evalavailyn(rs.getString("master_evalavailyn"));
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
