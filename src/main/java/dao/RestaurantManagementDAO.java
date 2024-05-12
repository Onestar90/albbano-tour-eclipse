package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DbConnection;
import vo.ResListVO;
import vo.SpotListVO;

/**
 * 맛집 추가,삭제,수정을 하는 DAO 클래스
 */
public class RestaurantManagementDAO {
	private static RestaurantManagementDAO rdDAO;

	private RestaurantManagementDAO() {

	}

	public static RestaurantManagementDAO getInstance() {
		if (rdDAO == null) {
			rdDAO = new RestaurantManagementDAO();
		}
		return rdDAO;
	}

	/**
	 * 사용자의 편의를 위해서 DB내의 max값을 가져와서 반환하는 method
	 * @return
	 * @throws SQLException
	 */
	public String selectMaxRes() throws SQLException {
		String code ="";
		StringBuilder sb= new StringBuilder("REST_");
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			String str ="select max(RES_CODE) RES_CODE from RESTAURANT";
			pstmt =con.prepareStatement(str);
			rs =pstmt.executeQuery();
			if(rs.next()) {
				code =rs.getString("RES_CODE");
			}
			int num =Integer.parseInt(code.substring(5));
			sb.append(String.format("%05d", num+1));
			code =sb.toString();
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		
		return code;
	}
	/**
	 * 맛집을 추가하는 method 24.05.06 김일신
	 * 
	 * @return int
	 */
	public int insertRest(ResListVO rVO) throws SQLException {
		int cnt = 0;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			StringBuilder sb = new StringBuilder();
			sb.append("insert into RESTAURANT ").append(
					"(RES_CODE, RES_CAT, RES_NAME, INTRO, HOLIDAY, BUSI_HOUR, RES_LOC, IMG_NAME, CREATE_DATE, LONGITUDE, LATITUDE, DEL_YN) ")
					.append("	values(?,?,?,?,?,?,?,?,sysdate,?,?,'N') ");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, rVO.getRes_code());
			pstmt.setString(2, rVO.getRes_cat());
			pstmt.setString(3, rVO.getRes_name());
			pstmt.setString(4, rVO.getIntro());
			pstmt.setString(5, rVO.getHoliday());
			pstmt.setString(6, rVO.getBusi_hour());
			pstmt.setString(7, rVO.getRes_loc());
			pstmt.setString(8, rVO.getImg_name());
			pstmt.setDouble(9, rVO.getLongitude());
			pstmt.setDouble(10, rVO.getLatitude());

			pstmt.executeUpdate();

		} finally {
			dbCon.closeCon(null, pstmt, con);
		}
		return cnt;

	}

	/**
	 * 관리자 화면에 맛집 리스트를 출력하는 method 24.05.07 김일신
	 * 
	 * @return List<ResListVO>
	 * @throws SQLException
	 */
	public List<ResListVO> selectAllRes() throws SQLException {
		List<ResListVO> list = new ArrayList<ResListVO>();
		ResListVO rVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			String select = "select * from RESTAURANT where DEL_YN ='N' ";
			pstmt = con.prepareStatement(select);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				rVO = new ResListVO();
				// RES_CODE , RES_CAT, RES_NAME, HOLIDAY, BUSI_HOUR, RES_LOC,
				// IMG_NAME, EDIT_DATE, LONGITUDE, LATITUDE, INTRO
				rVO.setRes_code(rs.getString("RES_CODE"));
				rVO.setRes_cat(rs.getString("RES_CAT"));
				rVO.setRes_name(rs.getString("RES_NAME"));
				rVO.setHoliday(rs.getString("HOLIDAY"));
				rVO.setBusi_hour(rs.getString("BUSI_HOUR"));
				rVO.setRes_loc(rs.getString("RES_LOC"));
				rVO.setImg_name(rs.getString("IMG_NAME"));
				rVO.setEdit_date(rs.getDate("EDIT_DATE"));
				rVO.setLongitude(rs.getDouble("LONGITUDE"));
				rVO.setLatitude(rs.getDouble("LATITUDE"));
				rVO.setIntro(rs.getString("INTRO"));

				list.add(rVO);
			}

		} finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return list;

	}

	/**
	 * 클릭 한 맛집의 상세정보를 확인/출력 하는 method 24.05.07 김일신
	 * 
	 * @param rsecode
	 * @return
	 * @throws SQLException
	 */
	public ResListVO selectRes(String rsecode) throws SQLException {
		ResListVO rVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			String select = "select * from RESTAURANT where RES_CODE= ? ";
			pstmt = con.prepareStatement(select);
			pstmt.setString(1, rsecode);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				rVO = new ResListVO();
				rVO.setRes_code(rs.getString("RES_CODE"));
				rVO.setRes_cat(rs.getString("RES_CAT"));
				rVO.setRes_name(rs.getString("RES_NAME"));
				rVO.setHoliday(rs.getString("HOLIDAY"));
				rVO.setBusi_hour(rs.getString("BUSI_HOUR"));
				rVO.setRes_loc(rs.getString("RES_LOC"));
				rVO.setImg_name(rs.getString("IMG_NAME"));
				rVO.setLongitude(rs.getDouble("LONGITUDE"));
				rVO.setLatitude(rs.getDouble("LATITUDE"));
				rVO.setIntro(rs.getString("INTRO"));
			}
		} finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return rVO;

	}

	/**
	 * 선택한 맛집의 정보를 수정하는 method 24.05.07 김일신
	 * 
	 * @param rVO
	 * @return int
	 * @throws SQLException
	 */
	public int updateRes(ResListVO rVO) throws SQLException {
		int cnt = 0;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			StringBuilder sb = new StringBuilder();
			
			sb.append("	update  RESTAURANT  ")
			.append("	set   RES_CAT = ? , RES_NAME = ? , HOLIDAY = ? , BUSI_HOUR =?, 	")
			.append("	RES_LOC =? , IMG_NAME =? ,	LONGITUDE =? , LATITUDE= ?, INTRO=? , EDIT_DATE= sysdate ")
			.append("	where RES_CODE = ? ");
			pstmt = con.prepareStatement(sb.toString());
			System.out.println(rVO);
			
			pstmt.setString(1, rVO.getRes_cat());
			pstmt.setString(2, rVO.getRes_name());
			pstmt.setString(3, rVO.getHoliday());
			pstmt.setString(4, rVO.getBusi_hour());
			pstmt.setString(5, rVO.getRes_loc());
			pstmt.setString(6, rVO.getImg_name());
			pstmt.setDouble(7, rVO.getLongitude());
			pstmt.setDouble(8, rVO.getLatitude());
			pstmt.setString(9, rVO.getIntro());
			pstmt.setString(10, rVO.getRes_code());
			
			cnt = pstmt.executeUpdate();
			System.out.println(sb);
			
			
			
		} finally {
			dbCon.closeCon(null, pstmt, con);

		}
	
		return cnt;
	}

	/**
	 * 맛집 추가/수정페이지에서 사용자의 편의성을 위해 맛집 카테고리를 DB에서 가져오는 method 24.05.09 김일신
	 * @return
	 * @throws SQLException
	 */
	public List<ResListVO> resCat() throws SQLException{
		List<ResListVO> list= new ArrayList<ResListVO>();
		ResListVO rVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			String cat ="select RES_CAT from RESTAURANT_CAT ";
			pstmt= con.prepareStatement(cat);
			rs= pstmt.executeQuery();
			while(rs.next()) {
					rVO=new ResListVO();
				rVO.setRes_cat(rs.getString("RES_CAT"));
				list.add(rVO);
			}
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		
		return list;
		
	}
	
	/**
	 * 해당 맛집의 논리삭제를 변경하는 method
	 * 24.05.10 김일신
	 * @param RES_CODE
	 * @return
	 * @throws SQLException
	 */
	public int deleteRes(String res_code) throws SQLException {
		int cnt = 0;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			String update ="update   RESTAURANT set      DEL_YN ='Y' where    RES_CODE = ?";
			pstmt = con.prepareStatement(update);
			pstmt.setString(1, res_code);
			
			pstmt.executeUpdate();
		} finally {
			dbCon.closeCon(null, pstmt, con);
		}
		return cnt;
	}
}