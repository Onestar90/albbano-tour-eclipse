package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import util.DbConnection;
import vo.ChartVO;

public class AdminDashboardDAO {
	
	private static AdminDashboardDAO adDAO;
	 private int totalMemberCount;
	 private int totalSpotCount;
	 private int totalSpotreviewCount;
	 private int totalInquiryCount;
	 private int totalTodayMemberCount;
	 private int totalResCount;
	 private int totalResreviewCount;
	 private int totalReservationCount;
	 private int resultCount;
	 
	 
	
	public static AdminDashboardDAO getInstance() {
		
		if(adDAO == null) {
			adDAO = new AdminDashboardDAO();
		}
		return adDAO;
	}
	
	public int getTotalMemberCount() {
        return totalMemberCount;
    }
	
	public int getTotalSpotCount() {
		return totalSpotCount;
	}
	
	public int getTotalSpotreviewCount() {
		return totalSpotreviewCount;
	}
	
	public int getTotalInquiryCount() {
		return totalInquiryCount;
	}
	public int getTotalTodayMemberCount() {
		return totalTodayMemberCount;
	}
	public int getTotalResCount() {
		return totalResCount;
	}
	
	public int getTotalResreviewCount() {
		return totalResreviewCount;
	}
	
	public int getTotalReservationCount() {
		return totalReservationCount;
	}
	
	
	public void selectTotalmembercnt() throws SQLException{
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		int totalMemberCount = 0;
		ResultSet rs = null;
		
		try {
		String selectQuery ="select count (*) ID from ADMIN";
		con = dbCon.getConn("jdbc/abn");
		pstmt = con.prepareStatement(selectQuery);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			totalMemberCount = rs.getInt(1);
			this.totalMemberCount = totalMemberCount;
		}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		
		}
		
	}//selectTotalmembercnt
	
	
public void selectTotalspotcnt() throws SQLException{
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		int totalMemberCount = 0;
		ResultSet rs = null;
		
		try {
		String selectQuery ="select count (*)SPOT_CODE from COURSE";
		con = dbCon.getConn("jdbc/abn");
		pstmt = con.prepareStatement(selectQuery);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			totalSpotCount = rs.getInt(1);
			this.totalSpotCount = totalSpotCount;
		}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		}//selectTotalspotcnt
		
		
		public void selectTotalspotreviewcnt() throws SQLException{
			
			DbConnection dbCon=DbConnection.getInstance();
			Connection con = null;
			PreparedStatement pstmt = null;
			int totalSpotreviewCount = 0;
			ResultSet rs = null;
			
			try {
			String selectQuery ="select count (*)SPOT_DOC_NO from SPOT_REVIEW";
			con = dbCon.getConn("jdbc/abn");
			pstmt = con.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalSpotreviewCount = rs.getInt(1);
				this.totalSpotreviewCount = totalSpotreviewCount;
			}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				dbCon.closeCon(rs, pstmt, con);
			}
			}//selectTotalspotreviewcnt
		
		
		public void selectTotalinquirycnt() throws SQLException{
			
			DbConnection dbCon=DbConnection.getInstance();
			Connection con = null;
			PreparedStatement pstmt = null;
			int totalInquiryCount = 0;
			ResultSet rs = null;
			
			try {
			String selectQuery ="SELECT COUNT(*) FROM QNA WHERE ANSWER_CONTENTS IS NULL";
			con = dbCon.getConn("jdbc/abn");
			pstmt = con.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalInquiryCount = rs.getInt(1);
				this.totalInquiryCount = totalInquiryCount;
			}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				dbCon.closeCon(rs, pstmt, con);
			}
			}//selectTotalinquirycnt
		
		
public void selectTodaymemvercnt() throws SQLException{
			
			DbConnection dbCon=DbConnection.getInstance();
			Connection con = null;
			PreparedStatement pstmt = null;
			int totalTodayMemberCount = 0;
			ResultSet rs = null;
			
			try {
			String selectQuery ="SELECT COUNT(*) FROM MEMBER WHERE TRUNC(CREATE_DATE) = TRUNC(SYSDATE)";
			con = dbCon.getConn("jdbc/abn");
			pstmt = con.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalTodayMemberCount = rs.getInt(1);
				this.totalTodayMemberCount = totalTodayMemberCount;
			}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				dbCon.closeCon(rs, pstmt, con);
			}
			}//selectTodaymemvercnt
		
	
public void selectTotalRescnt() throws SQLException{
	
	DbConnection dbCon=DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	int totalResCount = 0;
	ResultSet rs = null;
	
	try {
	String selectQuery ="select count (*) RES_CODE from RESTAURANT";
	con = dbCon.getConn("jdbc/abn");
	pstmt = con.prepareStatement(selectQuery);
	rs = pstmt.executeQuery();
	if(rs.next()) {
		totalResCount = rs.getInt(1);
		this.totalResCount = totalResCount;
	}
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		dbCon.closeCon(rs, pstmt, con);
	}
	}//selectTotalRescnt

public void selectResreviewcnt() throws SQLException{
	
	DbConnection dbCon=DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	int totalResreviewCount = 0;
	ResultSet rs = null;
	
	try {
	String selectQuery ="select count (*)  RES_DOC_NO from RESTAURANT_REVIEW";
	con = dbCon.getConn("jdbc/abn");
	pstmt = con.prepareStatement(selectQuery);
	rs = pstmt.executeQuery();
	if(rs.next()) {
		totalResreviewCount = rs.getInt(1);
		this.totalResreviewCount = totalResreviewCount;
	}
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		dbCon.closeCon(rs, pstmt, con);
	}
	}//selectResreviewcnt


public void selectReservationcnt() throws SQLException{
	
	DbConnection dbCon=DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	int totalReservationCount = 0;
	ResultSet rs = null;
	
	try {
	String selectQuery ="SELECT COUNT(*) FROM RESERVATION WHERE  RESV_FLAG IS NULL";
	con = dbCon.getConn("jdbc/abn");
	pstmt = con.prepareStatement(selectQuery);
	rs = pstmt.executeQuery();
	if(rs.next()) {
		totalReservationCount = rs.getInt(1);
		this.totalReservationCount = totalReservationCount;
	}
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		dbCon.closeCon(rs, pstmt, con);
	}
	}//selectReservationcnt

public List<ChartVO> selectChart() throws SQLException {
    List<ChartVO> list = new ArrayList<>();
    DbConnection dbCon = DbConnection.getInstance();
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        con = dbCon.getConn("jdbc/abn");
        
        StringBuilder selectQuery = new StringBuilder();
        selectQuery.append("SELECT c.CRS_CODE, c.CRS_NAME, r.TOUR_DATE, r.PERSON ")
                   .append("FROM course c, RESERVATION r ")
                   .append("WHERE c.CRS_CODE = r.CRS_CODE");

        pstmt = con.prepareStatement(selectQuery.toString());
        rs = pstmt.executeQuery();
        
        while (rs.next()) {
            ChartVO chartVO = new ChartVO(rs.getString("CRS_CODE"), rs.getString("CRS_NAME"),
                                          rs.getInt("PERSON"), rs.getDate("TOUR_DATE"));
            list.add(chartVO);
        }
    } finally {
        dbCon.closeCon(rs, pstmt, con);
    }
    return list;
}
	
	

}
