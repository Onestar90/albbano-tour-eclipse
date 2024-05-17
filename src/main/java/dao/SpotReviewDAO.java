package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DbConnection;
import vo.QnaSearchVO;
import vo.QnaVO;
import vo.RestaurantReviewVO;
import vo.SpotReviewVO;


public class SpotReviewDAO {
	
	
	private static SpotReviewDAO sptRevDAO;

	private SpotReviewDAO() {
		
	}
	
	public static SpotReviewDAO getInstance() {
		if(sptRevDAO==null) {
			sptRevDAO = new SpotReviewDAO();
		}
		return sptRevDAO;
		
	}
	
	
public int selecttotalCount(QnaSearchVO qsVO)throws SQLException{
		
		int totalCnt=0;
		List<QnaVO> list = new ArrayList<QnaVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		DbConnection db=DbConnection.getInstance();
		try {
			con=db.getConn("jdbc/abn");
			StringBuilder selectCnt=new StringBuilder();
			selectCnt.append("select count(*) SPOT_DOC_NO from SPOT_REVIEW");
			
			pstmt=con.prepareStatement(selectCnt.toString());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				totalCnt=rs.getInt("SPOT_DOC_NO");
			}
			
		}finally {
			db.closeCon(rs, pstmt, con);
		}
	
		return totalCnt;
	}
	

	
	
	public int insertSpotReview(
			String spot_code, String spot_title, String spot_contents, String id, String star) throws SQLException {
		

		int flag = 0;
		
		int num = setNom()+1;
		//코드번호 순차적으로 증가 
		String numString = String.format("%05d", num);
		String resultNum = "SPT_S" + numString;
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con =dbCon.getConn("jdbc/abn");
			String insert_spotReview =
			"insert into SPOT_REVIEW  (SPOT_DOC_NO, SPOT_CODE, SPOT_TITLE, SPOT_CONTENTS, ID, STAR, CREATE_DATE, EDIT_DATE)  values(?,?,?,?,?,?,sysdate,sysdate) ";
			pstmt= con.prepareStatement(insert_spotReview);
			pstmt.setString(1, resultNum);	
			pstmt.setString(2, spot_code);	
			pstmt.setString(3, spot_title);
			pstmt.setString(4, spot_contents);
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
					"SELECT * FROM( SELECT * FROM SPOT_REVIEW ORDER BY spot_doc_no DESC) WHERE ROWNUM = 1 ";
			pstmt= con.prepareStatement(select);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				StringNum = rs.getString("spot_doc_no");
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

	

	public List<SpotReviewVO> selectSptAllReview(QnaSearchVO qsVO,String spotcode)throws SQLException {
		List<SpotReviewVO> list = new ArrayList<SpotReviewVO>();
		SpotReviewVO sVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
		
		con =dbCon.getConn("jdbc/abn");
		String selectspot =
				"SELECT * FROM (SELECT SPOT_DOC_NO, SPOT_CODE, SPOT_TITLE, SPOT_CONTENTS, ID, STAR, CREATE_DATE, ROW_NUMBER() OVER (order by TO_NUMBER(star) DESC) RNUM FROM SPOT_REVIEW where SPOT_CODE = ?) WHERE RNUM BETWEEN ? AND ? ";
		pstmt= con.prepareStatement(selectspot);
		pstmt.setString(1, spotcode);
		pstmt.setInt(2, qsVO.getStartNum());
	    pstmt.setInt(3, qsVO.getEndNum());
	    
	    
	    
		rs = pstmt.executeQuery();
		while(rs.next()) {
			sVO = new SpotReviewVO();
        	sVO.setSpot_doc_no(rs.getString("spot_doc_no"));
        	sVO.setStar(rs.getString("star"));
        	sVO.setCreate_date(rs.getDate("create_date"));
        	sVO.setSpot_title(rs.getString("spot_title"));
        	sVO.setSpot_doc_no(rs.getString("spot_doc_no"));
        	sVO.setSpot_contents(rs.getString("spot_contents"));
        	sVO.setId(rs.getString("id"));
        	
        	list.add(sVO);
		}
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return list;
		
	}
	
	public SpotReviewVO selectSpotReviewDetail(String spot_doc_no) throws SQLException {
		SpotReviewVO sVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			
			con =dbCon.getConn("jdbc/abn");
			String sql =
			"select * from spot_REVIEW where spot_doc_no = ? ";
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, spot_doc_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sVO = new SpotReviewVO();    
	        	sVO.setCreate_date(rs.getDate("create_date"));
	        	sVO.setSpot_title(rs.getString("spot_title"));
	        	sVO.setSpot_contents(rs.getString("spot_contents"));
	        	sVO.setStar(rs.getString("star")) ;
	        	sVO.setId(rs.getString("id"));

			}
			}finally {
				dbCon.closeCon(rs, pstmt, con);
			}

		return sVO;
	}
	
	
	
	
	
	
	
	
	
	public int updateSpotReview(String spot_doc_no, String spot_title, String spot_contents, String star ) throws SQLException {
		int cnt= 0;
		int flag=0;
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con =dbCon.getConn("jdbc/abn");
			String sql = "update spot_REVIEW set spot_title = ?, star = ?, spot_contents = ? where spot_doc_no = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, spot_title);
			pstmt.setString(2, star);
			pstmt.setString(3, spot_contents);
			pstmt.setString(4, spot_doc_no);
			cnt = pstmt.executeUpdate();
			
			
			
		 } catch (Exception e) {
			 	flag = 1;
	            e.printStackTrace();;
	        } finally {
				dbCon.closeCon(rs, pstmt, con);
			}
		return flag;
	}
	
	
	
	
	
	public int deleteSpotReview(String spot_doc_no) throws SQLException {
		int cnt= 0;
		
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con =dbCon.getConn("jdbc/abn");
			String sql = "delete from spot_REVIEW where spot_doc_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, spot_doc_no);
			cnt = pstmt.executeUpdate();
			
			
		 } catch (Exception e) {
	            e.printStackTrace();;
	        } finally {
				dbCon.closeCon(rs, pstmt, con);
			}
		return cnt;
	}
	
	
	public List<SpotReviewVO> selectSptAllReview()throws SQLException {
		List<SpotReviewVO> list = new ArrayList<SpotReviewVO>();
		SpotReviewVO sVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
		
		con =dbCon.getConn("jdbc/abn");
		String selectspot =
				"select SPOT_DOC_NO, s.SPOT_NAME, SPOT_TITLE, id, STAR from SPOT_REVIEW sr, SPOT s where sr.SPOT_CODE = s.SPOT_CODE ";
		pstmt= con.prepareStatement(selectspot);
	    
		rs = pstmt.executeQuery();
		while(rs.next()) {
			sVO = new SpotReviewVO();
        	sVO.setSpot_doc_no(rs.getString("spot_doc_no"));
        	sVO.setSpot_name(rs.getString("spot_name"));
        	sVO.setSpot_title(rs.getString("spot_title"));
        	sVO.setId(rs.getString("id"));
        	sVO.setStar(rs.getString("star"));

        	list.add(sVO);
		}
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return list;
		
	}
	
	
	
	
	
	
	
}