package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DbConnection;
import vo.SpotListVO;

public class SpotDAO {

	private static SpotDAO sDAO;

	private SpotDAO() {

	}

	public static SpotDAO getInstance() {
		if (sDAO == null) {
			sDAO = new SpotDAO();
		}
		return sDAO;

	}

	/**
	 * 24.04.30 김일신 사용자 화면에서 관광지 리스트를 가져오는 DAO
	 * 
	 * @return
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
			String selectSpot = "select * from spot order by SPOT_CODE asc";
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
	 * 24.05.01 김일신 관광지 상세 페이지에서 해당 관광지의 정보를 가져오는 DAO
	 * 
	 * @param spotcode
	 * @return SpotListVO
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
	
	

}
