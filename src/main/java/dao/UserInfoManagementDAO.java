package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DbConnection;
import vo.UserInfoVO;

public class UserInfoManagementDAO {

	private static UserInfoManagementDAO uiDAO;
	
	private UserInfoManagementDAO() {
		
	}
	
	public static UserInfoManagementDAO getInstance() {
		if(uiDAO == null) {
			uiDAO = new UserInfoManagementDAO();
		}//end if
		return uiDAO;
	}//getInstance
	
	/**
	 * 아이디 중복확인
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public String selectId(String id) throws SQLException{
		String returnId="";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con=db.getConn("jdbc/abn");
			pstmt = con.prepareStatement("select id from member where id=?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				returnId=rs.getString("id");
			}
		}finally {
			db.closeCon(rs, pstmt, con);
		}
		
		System.out.println("======================되나?");
		return returnId;
	}
	
	
	/**
	 * 회원가입_id, name, tel, email, create_date 추가
	 * @param uiVO
	 * @throws SQLException
	 */
	public void insertMember(UserInfoVO uiVO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection db = DbConnection.getInstance();
		try {
			con = db.getConn("jdbc/abn");
			
			//member 테이블에 회원 추가
			StringBuilder memberInsert = new StringBuilder();
			memberInsert
			.append("insert into member")
			.append("(id, name, tel, email, create_date)")
			.append("values (?,?,?,?,SYSDATE)");
			
			
			pstmt = con.prepareStatement(memberInsert.toString());
            pstmt.setString(1, uiVO.getId());
            pstmt.setString(2, uiVO.getName());
            pstmt.setString(3, uiVO.getTel());
            pstmt.setString(4, uiVO.getEmail());
            //pstmt.setString(4, uiVO.getEmail1()+"@"+uiVO.getEmail2()); //이메일 1,2 합치는 과정 필요
            pstmt.executeUpdate();
            
		}finally {
			db.closeCon(null, pstmt, con);
		}//end finally
		System.out.println("======================되나?222");
	}//insertUser
	
	/**
	 * 회원가입 pass 추가
	 * @param id
	 * @param uiVO
	 * @throws SQLException
	 */
	public void insertPassword(String id, UserInfoVO uiVO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection db = DbConnection.getInstance();
		try {
			con = db.getConn("jdbc/abn");
			
			StringBuilder passwordInsert = new StringBuilder();
			passwordInsert
			.append("insert into password")
			.append("(id, password, create_date)")
			.append("values (?,?, SYSDATE)");
			
			pstmt = con.prepareStatement(passwordInsert.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, uiVO.getPass());
			pstmt.executeUpdate();
		}finally {
			db.closeCon(null, pstmt, con);
		}//end finally
		System.out.println("======================되나?333");
	}//insertUser
	
	
	/**
	 * 아이디 찾기
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	/*
	 * public String selectId(String id) throws SQLException{ String returnId="";
	 * 
	 * Connection con = null; PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * DbConnection db = DbConnection.getInstance();
	 * 
	 * try { con=db.getConn("jdbc/abn"); pstmt =
	 * con.prepareStatement("select id from member where id=?"); pstmt.setString(1,
	 * id); rs=pstmt.executeQuery(); if(rs.next()) { returnId=rs.getString("id"); }
	 * }finally { db.closeCon(rs, pstmt, con); }
	 * 
	 * System.out.println("======================되나?"); return returnId; }
	 */
	
	
}
