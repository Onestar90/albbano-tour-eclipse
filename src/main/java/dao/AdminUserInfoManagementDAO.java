package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DbConnection;
import vo.AdminSearchVO;
import vo.UserInfoVO;


public class AdminUserInfoManagementDAO {

	private static AdminUserInfoManagementDAO aduiDAO;
	
	private String[] columnNames;
	
	private AdminUserInfoManagementDAO() {
		
	}
	
	public static AdminUserInfoManagementDAO getInstance() {
		if(aduiDAO==null) {
			aduiDAO=new AdminUserInfoManagementDAO();
		}
		return aduiDAO;
	}//getInstance
	
	/**
	 * 총 레코드 수
	 * @param asVO
	 * @return
	 * @throws SQLException
	 */
	public int selectTotalCount(AdminSearchVO asVO) throws SQLException{
		int totalCnt=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con=db.getConn("jdbc/abn");
			StringBuilder selectCnt= new StringBuilder();
			selectCnt.append("select count(*) cnt from member");
			
			pstmt= con.prepareStatement(selectCnt.toString());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				totalCnt=rs.getInt("cnt");
			}//end if
		}finally {
			db.closeCon(rs, pstmt, con);
		}//end finally
		
		return totalCnt;
	}//totalCount
	
	
	/**
	 * 회원 리스트
	 * @param asVO
	 * @return
	 * @throws SQLException
	 */
	public List<UserInfoVO> selectInfo(AdminSearchVO asVO) throws SQLException{
		List<UserInfoVO> list = new ArrayList<UserInfoVO>();
		
		Connection con = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		DbConnection db=DbConnection.getInstance();
		
		try {
			con=db.getConn("jdbc/abn");
			StringBuilder selectBoard=new StringBuilder();
			selectBoard
			.append("	select id, tel, email, create_date, rnum")
			.append("	from(select id, tel, email, create_date,")
			.append("		row_number() over(order by create_date desc) rnum")
			.append("		from member");
			/*.append("	where rnum between ? and ?");*/
						
			if(asVO.getKeyword() != null && !"".equals(asVO.getKeyword())) {
				selectBoard
				.append(" where instr(").append(columnNames[Integer.parseInt(asVO.getField())])
				.append(",? ) > 0 ");
			}//end if
			selectBoard.append(" ) where rnum between ? and ? ");
			
			pstmt=con.prepareStatement(selectBoard.toString());
			
			int bindIndex=0;
			if(asVO.getKeyword() != null && !"".equals(asVO.getKeyword())) {
				pstmt.setString(++bindIndex, asVO.getKeyword());
			}//end if
			
			pstmt.setInt(++bindIndex, asVO.getStartNum());
			pstmt.setInt(++bindIndex, asVO.getEndNum());
			
			rs=pstmt.executeQuery();
			UserInfoVO uiVO=null;
			while(rs.next()) {
				uiVO=new UserInfoVO(rs.getString("id"), null, null, rs.getString("tel"),
						rs.getString("email"), rs.getDate("create_date"), null,null,null,null);	
				list.add(uiVO);
			}//end while
		}finally {
			db.closeCon(rs, pstmt, con);
		}//end finally
		return list;
	}//selectBoard
	
}
