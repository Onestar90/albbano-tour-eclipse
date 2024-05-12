package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DbConnection;
import vo.SpotListVO;

public class SpotManagementDAO {
	private static SpotManagementDAO smDAO;

	private SpotManagementDAO() {

	}

	public static SpotManagementDAO getInstance() {
		if (smDAO == null) {
			smDAO = new SpotManagementDAO();
		}
		return smDAO;
	}
	/**
	 * 사용자의 편의를 위해서 DB내의 max값을 가져와서 반환하는 method
	 * @return
	 * @throws SQLException
	 */
	public String selectMaxSpot() throws SQLException {
		String code ="";
		StringBuilder sb= new StringBuilder("SPOT_");
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			String str ="select max(SPOT_CODE) SPOT_CODE from SPOT";
			pstmt =con.prepareStatement(str);
			rs =pstmt.executeQuery();
			if(rs.next()) {
				code =rs.getString("SPOT_CODE");
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
	 * 관광지를 추가하는 method 	 
 	 * 24.05.02 김일신
	 * @param sVO
	 * @return
	 * @throws SQLException
	 */
	public int insertSpot(SpotListVO sVO) throws SQLException {
		int cnt = 0;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			String insert = "insert into SPOT values (?,?,?,?,sysdate,?,?,'N',?)";
			pstmt = con.prepareStatement(insert);
			System.out.println(sVO.toString());
			pstmt.setString(1, sVO.getSpot_code());
			pstmt.setString(2, sVO.getSpot_name());
			pstmt.setString(3, sVO.getSpot_desc());
			pstmt.setString(4, sVO.getImg_name());
			pstmt.setDouble(5, sVO.getLongitude());
			pstmt.setDouble(6, sVO.getLatitude());
			pstmt.setString(7, sVO.getSpt_loc());
			System.out.println(insert);
			pstmt.executeUpdate();
		} finally {
			dbCon.closeCon(null, pstmt, con);
		}

		return cnt;
	}

	/**
	 * 관리자 화면에 관광지 리스트를 출력하는 method 24.05.02 김일신
	 * 
	 * @return List<SpotListVO>
	 * @throws SQLException
	 */
	public List<SpotListVO> selectAlSpot() throws SQLException {

		List<SpotListVO> list = new ArrayList<SpotListVO>();
		SpotListVO sVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			String selectSpot = "select * from spot";
			pstmt = con.prepareStatement(selectSpot);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sVO = new SpotListVO();
				sVO.setSpot_code(rs.getString("SPOT_CODE"));
				sVO.setSpot_name(rs.getString("spot_name"));
				sVO.setSpot_desc(rs.getString("spot_desc"));
				sVO.setImg_name(rs.getString("img_name"));
				sVO.setCreate_date(rs.getDate("create_date"));
				sVO.setLongitude(rs.getDouble("longitude"));
				sVO.setLatitude(rs.getDouble("latitude"));
				sVO.setSpt_loc(rs.getString("spt_loc"));

				list.add(sVO);
			}
		} finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return list;
	}

	/**
	 * 클릭 한 관광지의 상세정보를 확인출력하는 method 24.05.02 김일신
	 * 
	 * @param spotcode
	 * @return
	 * @throws SQLException
	 */
	public SpotListVO selectSpot(String spotcode) throws SQLException {
		SpotListVO sVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dbCon.getConn("jdbc/abn");

			String selectspot = "select * from spot where spot_code = ? ";
			pstmt = con.prepareStatement(selectspot);
			pstmt.setString(1, spotcode);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sVO = new SpotListVO();
				sVO.setSpot_code(rs.getString("SPOT_CODE"));
				sVO.setSpot_name(rs.getString("spot_name"));
				sVO.setSpot_desc(rs.getString("spot_desc"));
				sVO.setImg_name(rs.getString("img_name"));
				sVO.setCreate_date(rs.getDate("create_date"));
				sVO.setLongitude(rs.getDouble("longitude"));
				sVO.setLatitude(rs.getDouble("latitude"));
				sVO.setSpt_loc(rs.getString("spt_loc"));
			}
		} finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return sVO;

	}

	/**
	 * 관리자 화면에서 선택 한 관광지의 정보를 수정하는 method 24.05.03 김일신
	 * 
	 * @param sVO
	 * @return
	 * @throws SQLException
	 */
	public int updateSpot(SpotListVO sVO) throws SQLException {
		int cnt = 0;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			StringBuilder update = new StringBuilder();
			update.append("	update  SPOT	")
			.append("	set  SPOT_NAME =? , SPOT_DESC =?, IMG_NAME =?, LONGITUDE =?, LATITUDE =?, SPT_LOC =?	")
			.append("	where   SPOT_CODE =?	");
			pstmt = con.prepareStatement(update.toString());
			pstmt.setString(1, sVO.getSpot_name());
			pstmt.setString(2, sVO.getSpot_desc());
			pstmt.setString(3, sVO.getImg_name());
			pstmt.setDouble(4, sVO.getLongitude());
			pstmt.setDouble(5, sVO.getLatitude());
			pstmt.setString(6, sVO.getSpt_loc());
			pstmt.setString(7, sVO.getSpot_code());

			pstmt.executeUpdate();
		} finally {
			dbCon.closeCon(null, pstmt, con);
		}
		return cnt;
	}
	public int deleteSpot(String spot_code) throws SQLException {
		int cnt = 0;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			String update ="update   SPOT set      DEL_YN ='Y' where    SPOT_CODE = ?";
			pstmt = con.prepareStatement(update);
			pstmt.setString(1, spot_code);
			
			pstmt.executeUpdate();
		} finally {
			dbCon.closeCon(null, pstmt, con);
		}
		return cnt;
	}
}
