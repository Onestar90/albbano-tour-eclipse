package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import util.DbConnection;
import vo.ResListVO;
import vo.SearchVO;



public class ResListDAO {
	
	private static ResListDAO rDAO;
	
	
	public static ResListDAO getInstance() {
		
		if(rDAO ==null) {
			rDAO =new ResListDAO();
		}
		return rDAO;
	}
	
	public List<ResListVO> selectAllRes() throws SQLException, ClassNotFoundException {
		List<ResListVO> list = new ArrayList<ResListVO>();
		ResListVO rVO = null;
		DbConnection dbCon = DbConnection.getInstance();

	    Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
  
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            con = dbCon.getConn("jdbc/abn");

            String sql = "select * from RESTAURANT where DEL_YN ='N'" ;
            pstmt = con.prepareStatement(sql);
            rs=pstmt.executeQuery();
            while(rs.next()) {
            	rVO = new ResListVO();
            	rVO.setRes_code(rs.getString("res_code"));  
            	rVO.setRes_name(rs.getString("res_name"));
            	rVO.setImg_name(rs.getString("img_name"));
            	rVO.setCreate_date(rs.getDate("create_date"));
            	rVO.setLongitude(rs.getInt("longitude"));
            	rVO.setLatitude(rs.getInt("latitude"));
            	rVO.setIntro(rs.getString("intro"));
            	
     	
            	list.add(rVO);
            }}finally{
    			dbCon.closeCon(rs, pstmt, con);
    		}
    		return list;
    		}
	
	
	public ResListVO selectRes(String rescode)throws SQLException {
		ResListVO rVO= null;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
		
		con =dbCon.getConn("jdbc/abn");
		String sql =
		"select * from RESTAURANT where res_code = ? ";
		pstmt= con.prepareStatement(sql);
		pstmt.setString(1, rescode);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			rVO = new ResListVO();
			rVO.setRes_code(rs.getString("res_code"));
			rVO.setRes_name(rs.getString("res_name"));
			rVO.setIntro(rs.getString("intro"));
			rVO.setImg_name(rs.getString("img_name"));
			rVO.setCreate_date(rs.getDate("create_date"));
			rVO.setLongitude(rs.getDouble("longitude"));
			rVO.setLatitude(rs.getDouble("latitude"));
			rVO.setDel_yn(rs.getString("del_yn"));
			rVO.setRes_loc(rs.getString("res_loc"));
			rVO.setBusi_hour(rs.getString("busi_hour"));
			rVO.setHoliday(rs.getString("holiday"));
			
			
		}
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return rVO;
		
	}
	
	
	
	
//	public int selecttotalCount(SearchVO sVO) throws SQLException {
//		
//		int totalCnt =0;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		DbConnection dbCon = DbConnection.getInstance();
//		
//		try {
//			con = dbCon.getConn("jdbc/dbcp");
//			//4. 쿼리문 생성객체 얻기(Dynamic Query)
//				StringBuilder selectCnt = new StringBuilder();
//			selectCnt.append(" select count (*) cnt from RESTAURANT_REVIEW");
//			pstmt=con.prepareStatement(selectCnt.toString());
//				//5. 바인드 변수 값 설정
//			//6. 쿼리문 수행 후 결과 얻기
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				totalCnt = rs.getInt("cnt");
//			}
//			}finally {
//				//7. 연결 끊기
//				dbCon.closeCon(rs, pstmt, con);
//			}
//			return totalCnt;
//	
//	}
//	
//	public List<ResListVO> selectBoard (SearchVO sVO) throws SQLException{
//		List<ResListVO> list = new ArrayList<ResListVO>();
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		DbConnection db = DbConnection.getInstance();
//		try {
//			con =db.getConn("jdbc/dbcp");
//			StringBuilder sb = new StringBuilder();
//			sb.
//			append("  select NUM, TITLE, CONTENT, ID, INPUT_DATE, CNT , rnum  ").
//			append("	from (select NUM, TITLE, CONTENT, ID, INPUT_DATE, CNT ,	").
//			append("	row_number() over (order by INPUT_DATE desc) rnum from  BOARD)	").
//			append("	where rnum  between ? and ?	");
//			pstmt = con.prepareStatement(sb.toString());
//			pstmt.setInt(1, sVO.getStartNum());
//			pstmt.setInt(2, sVO.getEndNum());
//			rs =pstmt.executeQuery();
//			ResListVO bVO = null;
//			while(rs.next()) {
//				bVO = new ResListVO(0, null, null, null, null, null, null, null);
//				list.add(bVO);
//			}
//		}finally {
//			db.closeCon(rs, pstmt, con);
//		}
//		return list;
//	}
//	
//	
//	
//	
//	
//	
//	
//	
	
	
	

}














