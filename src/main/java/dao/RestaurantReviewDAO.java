package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DbConnection;
import vo.QnaSearchVO;
import vo.QnaVO;
import vo.ResListVO;
import vo.RestaurantReviewVO;

public class RestaurantReviewDAO {
	
	private static RestaurantReviewDAO resRevDAO;
	
	private RestaurantReviewDAO() {
		

	}
	
	public static RestaurantReviewDAO getInstance() {
		if(resRevDAO==null) {
			resRevDAO = new RestaurantReviewDAO();
		}
		return resRevDAO;
		
	}
	
	public int selecttotalCount(QnaSearchVO qsVO)throws SQLException{
		
		int totalCnt=0;	
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		DbConnection db=DbConnection.getInstance();
		try {
			con=db.getConn("jdbc/abn");
			StringBuilder selectCnt=new StringBuilder();
			selectCnt.append("select count(*) RES_DOC_NO from RESTAURANT_REVIEW");
			
			pstmt=con.prepareStatement(selectCnt.toString());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				totalCnt=rs.getInt("RES_DOC_NO");
			}
			
		}finally {
			db.closeCon(rs, pstmt, con);
		}
	
		return totalCnt;
	}
	
	
	
	
	
	
	public int insertResReview(
		 String res_code, String res_title, String res_contents, String id, String star) throws SQLException {
		
		int flag = 0;
		
		int num = setNom()+1;
		//코드번호 순차적으로 증가 
		String numString = String.format("%05d", num);
		String resultNum = "RES_V" + numString;
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con =dbCon.getConn("jdbc/abn");
			String insert_resReview =
			"insert into RESTAURANT_REVIEW  (RES_DOC_NO, RES_CODE, RES_TITLE, RES_CONTENTS, ID, STAR, CREATE_DATE)  values(?,?,?,?,?,?,sysdate) ";
			pstmt= con.prepareStatement(insert_resReview);
			pstmt.setString(1, resultNum);	
			pstmt.setString(2, res_code);	
			pstmt.setString(3, res_title);
			pstmt.setString(4, res_contents);
			pstmt.setString(5, id);
			pstmt.setString(6, star);
			pstmt.executeUpdate();
		
			
        } catch (Exception e) {
            e.printStackTrace();
            flag = 1;
        } finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		

		return flag;
	}
	
	
	public int setNom() throws SQLException {
		DbConnection dbCon = DbConnection.getInstance();
		String StringNum = "";
		String numberStr = "";
		int docNum = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con =dbCon.getConn("jdbc/abn");
			String select =
			"SELECT * FROM( SELECT * FROM RESTAURANT_REVIEW ORDER BY res_doc_no DESC) WHERE ROWNUM = 1 ";
			pstmt= con.prepareStatement(select);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				StringNum = rs.getString("res_doc_no");
			}
			
        } catch (Exception e) {
            e.printStackTrace();;
        } finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		if(StringNum != null) {
			numberStr = StringNum.replaceAll("[^0-9]", "");
			docNum = Integer.parseInt(numberStr);
		}
		
		return docNum;
	}
	
	
	
	public List<RestaurantReviewVO> selectResAllReview(QnaSearchVO qsVO, String rescode)throws SQLException {
		List<RestaurantReviewVO> list = new ArrayList<RestaurantReviewVO>();
		RestaurantReviewVO rVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
		
		con =dbCon.getConn("jdbc/abn");
		String sql =
		"SELECT * FROM (SELECT RES_DOC_NO, RES_CODE, RES_TITLE, RES_CONTENTS, ID, STAR, CREATE_DATE, ROW_NUMBER() OVER (order by TO_NUMBER(star) DESC) RNUM FROM RESTAURANT_REVIEW where RES_CODE = ?) WHERE RNUM BETWEEN ? AND ? ";
		pstmt= con.prepareStatement(sql);
		
		pstmt.setString(1, rescode);
		pstmt.setInt(2, qsVO.getStartNum());
	    pstmt.setInt(3, qsVO.getEndNum());
		
		
		
		rs = pstmt.executeQuery();
		while(rs.next()) {
			rVO = new RestaurantReviewVO();
        	rVO.setRes_doc_no(rs.getString("res_doc_no"));
        	rVO.setCreate_date(rs.getDate("create_date"));
        	rVO.setRes_title(rs.getString("res_title"));
        	rVO.setRes_contents(rs.getString("res_contents"));
        	rVO.setStar(rs.getString("star")) ;
        	rVO.setId(rs.getString("id"));
        	
        	list.add(rVO);
		}
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return list;
		
	}
	
	public RestaurantReviewVO selectRestaurantReviewDetail(String res_doc_no) throws SQLException {
		RestaurantReviewVO rVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			
			con =dbCon.getConn("jdbc/abn");
			String sql =
			"select * from RESTAURANT_REVIEW where res_doc_no = ? ";
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, res_doc_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rVO = new RestaurantReviewVO();    
	        	rVO.setCreate_date(rs.getDate("create_date"));
	        	rVO.setRes_title(rs.getString("res_title"));
	        	rVO.setRes_contents(rs.getString("res_contents"));
	        	rVO.setStar(rs.getString("star")) ;
	        	rVO.setId(rs.getString("id"));

			}
			}finally {
				dbCon.closeCon(rs, pstmt, con);
			}

		return rVO;
	}
		
	
	

	
	public int updateRestaurantReview(String res_doc_no, String res_title, String res_contents, String star ) throws SQLException {
		int cnt= 0;
		int flag=0;
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con =dbCon.getConn("jdbc/abn");
			String sql = "update RESTAURANT_REVIEW set res_title = ?, star = ?, res_contents = ? where res_doc_no = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, res_title);
			pstmt.setString(2, star);
			pstmt.setString(3, res_contents);
			pstmt.setString(4, res_doc_no);
			cnt = pstmt.executeUpdate();
			
			
		 } catch (Exception e) {
			 	flag = 1;
	            e.printStackTrace();;
	        } finally {
				dbCon.closeCon(rs, pstmt, con);
			}
		return flag;
	}
	
	
	
	
	
	public int deleteRestaurantReview(String res_doc_no) throws SQLException {
		int cnt= 0;
		int flag=0;
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con =dbCon.getConn("jdbc/abn");
			String sql = "delete from RESTAURANT_REVIEW where res_doc_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, res_doc_no);
			cnt = pstmt.executeUpdate();
			
		
		 } catch (Exception e) {
			 flag = 1;
	            e.printStackTrace();;
	        } finally {
				dbCon.closeCon(rs, pstmt, con);
			}
		return flag;
	}
	
	


}
