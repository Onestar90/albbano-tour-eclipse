package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DbConnection;
import vo.LoginVO;
import vo.UserInfoVO;

public class UserInfoManagementDAO {

	private static UserInfoManagementDAO uiDAO;
	
	public UserInfoManagementDAO() {
		
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
	public String searchId(String name,String email) throws SQLException{
		String id="";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con=db.getConn("jdbc/abn");
			
			StringBuilder selectId = new StringBuilder();
			selectId
			.append("	select id	")
			.append("	from member	")
			.append("	where name=? and email=?	");
			
			pstmt = con.prepareStatement(selectId.toString());
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				id=rs.getString("id");
			}
		}finally {
			db.closeCon(rs, pstmt, con);
		}
		
		return id;
	}//searchId
	 
	/**
	 * 비밀번호 찾기
	 * @param email
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public String searchPass(String email,String id) throws SQLException{
		String pass="";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con=db.getConn("jdbc/abn");
			
			StringBuilder selectPass = new StringBuilder();
			selectPass
			.append("	SELECT p.password	")
			.append("	FROM password p, member m	")
			.append("	WHERE m.id=p.id AND m.email=? AND m.id=?	");
			
			pstmt = con.prepareStatement(selectPass.toString());
			pstmt.setString(1, email);
			pstmt.setString(2, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				pass=rs.getString("password");
			}
		}finally {
			db.closeCon(rs, pstmt, con);
		}
		
		return pass;
	}//searchPass
	
	public UserInfoVO selectInfo(String userId) throws SQLException{
		UserInfoVO uiVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con=db.getConn("jdbc/abn");
			String sql = "select id, name, email, tel from member where id=?";
					
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				uiVO = new UserInfoVO();
				uiVO.setId(rs.getString("id"));
				uiVO.setName(rs.getString("name"));
				uiVO.setEmail(rs.getString("email"));
				uiVO.setTel(rs.getString("tel"));
						
			}
		}finally {
			db.closeCon(rs, pstmt, con);
		}
		
		return uiVO;
	}

	public boolean updatePass(UserInfoVO uiVO) throws SQLException{
		int cnt=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con=db.getConn("jdbc/abn");
			
			StringBuilder selectPass = new StringBuilder();
			selectPass
			.append("	update password	")
			.append("	set password= ?	")
			.append("	WHERE id=? AND password=?	");
			
			pstmt = con.prepareStatement(selectPass.toString());
			pstmt.setString(1, uiVO.getNewPass());
			pstmt.setString(2, uiVO.getId());
			pstmt.setString(3, uiVO.getPass());
			cnt=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.closeCon(null, pstmt, con);
		}
		
		if(cnt>0) {
			return true;
		}else {
			return false;
		}
	}//searchPass
	
	
	/**
	 * 회원정보 가져오기
	 * @param lVO
	 * @return
	 * @throws SQLException
	 */
	/*	
	
	public UserInfoVO selectInfo(String userId) throws SQLException{
		UserInfoVO uiVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con=db.getConn("jdbc/abn");
			String sql = "select id, name, email, tel from member where id=?";
					
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				uiVO = new UserInfoVO();
				uiVO.setId(rs.getString("id"));
				uiVO.setName(rs.getString("name"));
				uiVO.setEmail(rs.getString("email"));
				uiVO.setTel(rs.getString("tel"));
						
			}
		}finally {
			db.closeCon(rs, pstmt, con);
		}
		
		return uiVO;
	}
	
	public UserInfoVO selectInfoPw(LoginVO lVO) throws SQLException{
		UserInfoVO uiVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con=db.getConn("jdbc/abn");
			pstmt = con.prepareStatement("select password from password where id=?");
			pstmt.setString(1, lVO.getId());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				uiVO = new UserInfoVO(
						null,
		                rs.getString("pass"), 
		                null,
		                null,
		                null,
		                null,
		                null,
		                null,
		                null,
		                null);
			}
		}finally {
			db.closeCon(rs, pstmt, con);
		}
		
		return uiVO;
	}
	
	public int updateInfo(String name, String email, String tel ) throws SQLException{
		int cnt=0;
		int flag=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con=db.getConn("jdbc/abn");
			String sql = "update member set  name=?, email=?, tel=? where id=? ";
			pstmt = con.prepareStatement("update member set  name=?, email=?, tel=? where id=? ");
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, tel);
			
		}catch(Exception e){
			flag=1;
			e.printStackTrace();
		}finally {
			db.closeCon(null, pstmt, con);
		}
		
		return flag;
	}

	
*/
}
