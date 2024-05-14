package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DbConnection;
import vo.NoticeVO;

public class NoticeDAO {

	private static NoticeDAO NoticeDAO;

	private NoticeDAO() {

	}

	public static NoticeDAO getInstance() {
		if (NoticeDAO == null) {
			NoticeDAO = new NoticeDAO();
		}
		return NoticeDAO;
	}

	public List<NoticeVO> selectAll() throws SQLException {
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO noticeVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dbCon = DbConnection.getInstance();

		try {
			con = dbCon.getConn("jdbc/abn");

			String selectNotice = " select * from notice ";

			pstmt = con.prepareStatement(selectNotice);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				NoticeVO ntVO = new NoticeVO();
				ntVO.setDoc_No(rs.getString("doc_No"));
				ntVO.setTitle(rs.getString("title"));
				ntVO.setImg_Name(rs.getString("img_Name"));
				ntVO.setCreate_Date(rs.getDate("create_date"));
				ntVO.setId(rs.getString("id"));
				ntVO.setDoc_Cont(rs.getString("doc_Cont"));
				ntVO.setDel_yn(rs.getString("del_yn"));

				list.add(ntVO);
			}

		} finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return list;
	}

	public NoticeVO selectOne(String title) throws SQLException {
		NoticeVO ntVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dbCon = DbConnection.getInstance();

		try {

			con = dbCon.getConn("jdbc/abn");
			String selectOne = (" select * from notice where doc_No=? ");

			pstmt = con.prepareStatement(selectOne);

			pstmt.setString(1, title);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				ntVO = new NoticeVO();
				ntVO.setDoc_No(rs.getString("doc_No"));
				ntVO.setTitle(rs.getString("title"));
				ntVO.setImg_Name(rs.getString("img_Name"));
				ntVO.setCreate_Date(rs.getDate("create_date"));
				ntVO.setId(rs.getString("id"));
				ntVO.setDoc_Cont(rs.getString("doc_Cont"));
				ntVO.setDel_yn(rs.getString("del_yn"));
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {

			dbCon.closeCon(rs, pstmt, con);
		}
		return ntVO;
	}

	public void insertNotice(NoticeVO ntVO) throws SQLException {
//		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection dbCon = DbConnection.getInstance();

		try {
			con = dbCon.getConn("jdbc/abn");
			String insert = 
					" insert into notice(DOC_NO, TITLE, IMG_NAME, CREATE_DATE, ID, DOC_CONT, DEL_YN) values(?,?,?,sysdate,?,?,'N') ";

			pstmt = con.prepareStatement(insert);

			pstmt.setString(1, ntVO.getDoc_No());
			pstmt.setString(2, ntVO.getTitle());
			pstmt.setString(3, ntVO.getImg_Name());
			pstmt.setString(4, ntVO.getId());
			pstmt.setString(5, ntVO.getDoc_Cont());

			System.out.println( ntVO );
			pstmt.executeUpdate();
		} finally {
			dbCon.closeCon(null, pstmt, con);
		}
//		return cnt;
	}

	public int updateNotice(NoticeVO ntVO) throws SQLException {

		int cnt = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection dbCon = DbConnection.getInstance();

		try {
			con = dbCon.getConn("jdbc/abn");
			StringBuilder update = new StringBuilder();
			update.append(" update notice ").append(" set title=?, img_Name=?, doc_Cont=? ").append(" where doc_No=? ");

			pstmt = con.prepareStatement(update.toString());

			pstmt.setString(1, ntVO.getTitle());
			pstmt.setString(2, ntVO.getImg_Name());
			pstmt.setString(3, ntVO.getDoc_Cont());
			pstmt.setString(4, ntVO.getDoc_No());

			System.out.println( update );
			System.out.println( ntVO );
			cnt=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			dbCon.closeCon(null, pstmt, con);
		}
		return cnt;

	}

	/**
	 * 사용자의 편의를 위해서 DB내의 max값을 가져와서 반환하는 method
	 * 
	 * @return
	 * @throws SQLException
	 */
	public String selectMaxNotice() throws SQLException {
		String code = "";
		StringBuilder sb = new StringBuilder("NOTI_");
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			String str = "select max(doc_No) doc_No from notice";
			pstmt = con.prepareStatement(str);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				code = rs.getString("doc_No");
			}
			int num = Integer.parseInt(code.substring(5));
			sb.append(String.format("%05d", num + 1));
			code = sb.toString();
		} finally {
			dbCon.closeCon(rs, pstmt, con);
		}

		return code;
	}

	public int deleteNotice(String doc_No) throws SQLException {
		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection dbCon = DbConnection.getInstance();
		try {
			con = dbCon.getConn("jdbc/abn");
			String deleteNotice = " update notice set del_yn= 'y' where doc_No=? ";

			pstmt = con.prepareStatement(deleteNotice);

			pstmt.setString(1, doc_No);

			pstmt.executeUpdate();

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			dbCon.closeCon(null, pstmt, con);
		}
		return cnt;
	}

}
