package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DbConnection;
import vo.AdminSearchVO;
import vo.SearchVO;
import vo.UserInfoVO;


public class AdminUserInfoManagementDAO {

	private static AdminUserInfoManagementDAO aduiDAO;
	
	private String[] columnNames;
	
	private AdminUserInfoManagementDAO() {
		columnNames = new String[] {"id", "tel", "email", "create_date"}; 
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
	
	public UserInfoVO selectDetailBoard (String userId) throws SQLException {
		UserInfoVO uiVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection db = DbConnection.getInstance();
		try {
			con=db.getConn("jdbc/abn");
			StringBuilder selectInfo = new StringBuilder();
			selectInfo.append("	select name, id, tel, email, del_yn")
			.append("	from member	")
			.append("	where id= ? ");
			
		pstmt=con.prepareStatement(selectInfo.toString());
		pstmt.setString(1, userId);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			uiVO = new UserInfoVO(
					userId,
					null,
					rs.getString("name"),
					rs.getString("tel"),
					rs.getString("email"),
					null,
					null,
					null,
					null,
					null,
					null,
					rs.getString("del_yn"));
		}//end while
		}finally {
			db.closeCon(rs, pstmt, con);
		}
		return uiVO;
	}//selectDetailBoard
	
	public int deletePass(UserInfoVO uiVO) throws SQLException{
		int cnt=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		DbConnection db = DbConnection.getInstance();
		try {
			con=db.getConn("jdbc/abn");
			StringBuilder sb = new StringBuilder();
			sb.append("	delete from password	")
			.append("	where id=?	");
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, uiVO.getId());
			cnt =pstmt.executeUpdate();
		}finally {
			db.closeCon(null, pstmt, con);
		}
		System.out.println("================================1");
		return cnt;
	}
	
	public int deleteMember(UserInfoVO uiVO) throws SQLException{
		int cnt=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		DbConnection db = DbConnection.getInstance();
		try {
			con=db.getConn("jdbc/abn");
			StringBuilder sb = new StringBuilder();
			sb.append("	delete from member	")
			.append("	where id=?	");
			pstmt = con.prepareStatement(sb.toString());
			
			pstmt.setString(1, uiVO.getId());
			cnt =pstmt.executeUpdate();
		}finally {
			db.closeCon(null, pstmt, con);
		}
		System.out.println("================================2");
		return cnt;
	}
	
	
	public String pageNation(String url, String param ,int totalPage, int currentPage) {
		
		StringBuilder pageNation = new StringBuilder();
		//1. 한 화면에서 보여줄 페이지 인덱스의 수
		int pageNumber=3;
		//2. 화면에 보여줄 시작 페이지 번호
		int startPage=((currentPage-1)/pageNumber)*pageNumber+1;
		//3. 화면에 보여줄 마지막 페이지 번호
		int endPage=(((startPage-1)+pageNumber)/pageNumber)*pageNumber;
		//4. 총 페이지의 수가 연산된 마지막 페이지 수보다 작다면 총 페이지 수가 마지막 페이지 번호로 설정된다
		if(totalPage <= endPage ){
			endPage=totalPage;
		}//end if
		//5. 첫 페이지가 인덱스 화면이 아닌 경우
		String prevMark="[ << ]";
		int movePage=0;
		
		if(currentPage > pageNumber){//시작페이지보다 1적은 페이지로 이동
			movePage=startPage-1;
		prevMark="[ <a href='"+url+"?currentPage="+movePage+param+"'> &lt; &lt;</a>]";
		}//end if
		
		pageNation.append( prevMark ).append("...");
		//6. 시작페이지 번호 부터 끝 페이지 번호까지 화면에 출력
		
		movePage=startPage;
		
		//System.out.println(startPage+","+movePage+","+endPage); //오류 확인
		while( movePage <= endPage ){
			if(movePage==currentPage){// 현재 페이지의 링크는 활성화 할 필요가 없다
				pageNation.append("[ <span style='font-size:20px'>")
				.append(currentPage).append("</span> ]");
			}else{
				pageNation.append("[ <a href='").append(url)
				.append("?currentPage=").append(movePage).append(param).append("'>")
						.append(movePage).append("</a> ]");
			}//end else
			movePage++;
		}//end while
			
		//7.뒤에 페이지가 더 있는 경우
		String endMark="[ &gt;&gt; ]";
		if( totalPage > endPage ){
			movePage = endPage+1;
			endMark="[<a href='userInfo_list.jsp?currentPage="+movePage+param
					+"'> &gt;&gt;</a>]";
		}//end if
		
		pageNation.append(" ... ").append( endMark );
		
		return pageNation.toString();
	}
	
}
