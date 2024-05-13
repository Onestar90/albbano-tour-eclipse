package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DbConnection;
import vo.CourseManagementVO;
import vo.SpotListVO;

public class CourseManagementDAO {
	private static CourseManagementDAO cmDAO;

	private CourseManagementDAO() {

	}

	public static CourseManagementDAO getInstance() {
		if (cmDAO == null) {
			cmDAO = new CourseManagementDAO();
		}
		return cmDAO;
	}
	

	public List<CourseManagementVO> selectAllCurs() throws SQLException {
		List<CourseManagementVO> list = new ArrayList<CourseManagementVO>();
		CourseManagementVO cVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dbCon.getConn("jdbc/abn");

			String sb = "select * from COURSE where del_yn='N'";
			pstmt = con.prepareStatement(sb);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cVO = new CourseManagementVO();
				cVO.setCrsCode(rs.getString("CRS_code"));
				cVO.setCrsName(rs.getString("crs_name"));
				cVO.setCrsDesc(rs.getString("crs_desc"));
				cVO.setImgName(rs.getString("IMG_Name"));
				cVO.setFare(rs.getInt("fare"));
				list.add(cVO);
			}

		} finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return list;
	}

	/**
	 * 코스 소개 화면에서, 해당 코스의 관광지 리스트를 보여주는 method 현재 하나만 나오게 코딩되어있음. 24.05.02 김일신
	 * 
	 * @return List<SpotListVO>
	 * @throws SQLException
	 */
	public List<SpotListVO> selectAllSpot() throws SQLException {
		List<SpotListVO> list = new ArrayList<SpotListVO>();
		SpotListVO sVO = null;
		StringBuilder sb = new StringBuilder();
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dbCon.getConn("jdbc/abn");

			sb.append("	select s.SPOT_NAME	").append("	from SPOT s , TOUR_COURSE t 	")
					.append("	where (s.SPOT_CODE=t.SPOT_CODE)	");
			pstmt = con.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sVO = new SpotListVO();
				sVO.setSpot_name(rs.getString("spot_name"));
				list.add(sVO);
			}

		} finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return list;
	}

	/**
	 * 관리자 투어 상세 페이지에서, 해당 투어에 할당된 관광지의 이름을 순서대로 정렬해서 보여주는 method
	 * @param crsCode
	 * @return 
	 * @throws SQLException
	 */
	public String selectDetailSpot(String crsCode) throws SQLException {
		List<SpotListVO> list = new ArrayList<SpotListVO>();
		String spots="";
		SpotListVO sVO = null;
		StringBuilder sb = new StringBuilder();
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			sb.append("	select s.SPOT_NAME	").append("	from SPOT s , TOUR_COURSE t 	")
					.append("	where CRS_CODE =? and (t.SPOT_CODE=s.SPOT_CODE)	").append("order by SEQ asc");
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, crsCode);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sVO = new SpotListVO(rs.getString("spot_name"));
				list.add(sVO);
			}
			 spots =list.toString();

		} finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return  spots;
	}

	/**
	 * 해당 창에서 선택한 코스의 상세 내역을 보여주는 method 24.05.02 김일신
	 * 
	 * @param cur_code
	 * @return CourseManagementVO
	 * @throws SQLException
	 */
	public CourseManagementVO selectCourseDetail(String cur_code) throws SQLException {
		CourseManagementVO cmVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			con = dbCon.getConn("jdbc/abn");
			String selectCurDetail = "select  * from course where  CRS_code= ? ";
			pstmt = con.prepareStatement(selectCurDetail);
			pstmt.setString(1, cur_code);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cmVO = new CourseManagementVO();
				cmVO.setCrsCode(rs.getString("CRS_CODE"));
				cmVO.setCrsName(rs.getString("CRS_NAME"));
				cmVO.setCrsDesc(rs.getString("CRS_DESC"));
				cmVO.setImgName(rs.getString("IMG_NAME"));
				cmVO.setCreateDate(rs.getDate("CREATE_DATE"));
				cmVO.setFare(rs.getInt("FARE"));

			}
		} finally {
			dbCon.closeCon(rs, pstmt, con);
		}

		return cmVO;

	}

	/**
	 * 코스 추가 화면에서 DB에 입력 된 관광지 리스트를 보여주는 method 24.05.03 김일신
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<SpotListVO> selectAllSpotNames() throws SQLException {
		List<SpotListVO> list = new ArrayList<SpotListVO>();
		SpotListVO sVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			String select = " select SPOT_CODE, SPOT_NAME from spot order by SPOT_CODE asc";
			pstmt = con.prepareStatement(select);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sVO = new SpotListVO();
				sVO.setSpot_code(rs.getString("SPOT_CODE"));
				sVO.setSpot_name(rs.getString("SPOT_NAME"));
				list.add(sVO);
			}

		} finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return list;
	}

	/**
	 * 코스 테이블에 코스에 대한 정보를 저장하는 method 24.05.08 김일신
	 * 
	 * @param cVO
	 * @return
	 * @throws SQLException
	 */
	public int insertCurs(CourseManagementVO cVO) throws SQLException {
		int cnt = 0;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			String insert = // 'CURS_00001','동해안투어','대충 동해안 투어 한다는 내용','EAST_SEA',25000,sysdate,'N';
					"insert into COURSE values(?,?,?,?,?,sysdate,'N')";
			pstmt = con.prepareStatement(insert);
			pstmt.setString(1, cVO.getCrsCode());
			pstmt.setString(2, cVO.getCrsName());
			pstmt.setString(3, cVO.getCrsDesc());
			pstmt.setString(4, cVO.getImgName());
			pstmt.setInt(5, cVO.getFare());

			cnt = pstmt.executeUpdate();
		} finally {
			dbCon.closeCon(null, pstmt, con);
		}
		return cnt;
	}

	/**
	 * 투어코스 테이블에 해당 코스와 관광지 리스트들을 추가하는 매서드. 24.05.08 김일신
	 * 
	 * @param curCode
	 * @param curSpot
	 * @return
	 * @throws SQLException
	 */
	public int insertTourCurs(String curCode, String curSpot, int seq) throws SQLException {
		int cnt = 0;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			String insert = "insert into TOUR_COURSE values (?,?,?)";
			pstmt = con.prepareStatement(insert);
			pstmt.setString(1, curCode);
			pstmt.setString(2, curSpot);
			pstmt.setString(3, String.valueOf(seq));
			cnt = pstmt.executeUpdate();

		} finally {
			dbCon.closeCon(null, pstmt, con);
		}
		return cnt;

	}

	/**
	 * 코스 테이블의 내용을 업데이트 하는 method 24.05.08
	 * 
	 * @return
	 * @throws SQLException
	 */
	public int updateCurs(CourseManagementVO cVO) throws SQLException {
		int cnt = 0;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			StringBuilder update = new StringBuilder();
			update.append("	update COURSE	").
			append("	set    CRS_NAME =?, CRS_DESC=?, IMG_NAME=?, FARE=?	")
			.append("	where  CRS_CODE =?  ");

			pstmt = con.prepareStatement(update.toString());
			pstmt.setString(1, cVO.getCrsName());
			pstmt.setString(2, cVO.getCrsDesc());
			pstmt.setString(3, cVO.getImgName());
			pstmt.setInt(4, cVO.getFare());
			pstmt.setString(5, cVO.getCrsCode());

			cnt = pstmt.executeUpdate();

		} finally {
			dbCon.closeCon(null, pstmt, con);
		}
		return cnt;
	}

	/**
	 * 투어코스 테이블의 내용을 업데이트 하는 method 24.05.08
	 * 
	 * @return
	 * @throws SQLException
	 */
	public int updateTourCurs(String CRS_CODE, String SPOT_CODE , int seq) throws SQLException {
		int cnt = 0;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			StringBuilder update = new StringBuilder();
			update.append("	update  TOUR_COURSE	").
			append("	set  SPOT_CODE= ? ").
			append("	where  CRS_CODE=? and  seq =?	");
			//update.append("	update  TOUR_COURSE	").append("	set  SPOT_CODE= '"+SPOT_CODE+"'" )
			//.append("	where  CRS_CODE='"+CRS_CODE+"' and  seq ='"+seq+"'	");
			pstmt = con.prepareStatement(update.toString());
			pstmt.setString(1, SPOT_CODE);
			pstmt.setString(2, CRS_CODE);
			pstmt.setString(3, String.valueOf(seq) );

			cnt = pstmt.executeUpdate();
			
			System.out.println(update);
			//System.out.println(SPOT_CODE);
			//System.out.println(CRS_CODE);

		} finally {
			dbCon.closeCon(null, pstmt, con);
		}
		return cnt;
	}
}
