package dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.driver.DBConversion;
import util.DbConnection;
import vo.NoticeVO;
import vo.SearchVO;

public class NoticeDAO {

	private static NoticeDAO NoticeDAO;
	private String[] columnNames;
	
	private NoticeDAO() {
		columnNames= new String[] {"title","content","id"};
	}
	
	
	
	public static NoticeDAO getInstance() {
		if(NoticeDAO == null) {
			NoticeDAO = new NoticeDAO();
		}
		return NoticeDAO;
	}
	
	
	public List<NoticeVO> selectAll() throws SQLException{
		List<NoticeVO> list= new ArrayList<NoticeVO>();
		NoticeVO noticeVO=null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		DbConnection dbCon= DbConnection.getInstance();
		
		try {
			con =dbCon.getConn("jdbc/abn");
			
			String selectNotice=" select * from notice ";
			
			pstmt=con.prepareStatement(selectNotice);
			
			rs=pstmt.executeQuery();			
			
			while(rs.next()) {
				NoticeVO ntVO= new NoticeVO();
				ntVO.setDoc_No(rs.getString("doc_No"));
				ntVO.setTitle(rs.getString("title"));
				ntVO.setImg_Name(rs.getString("img_Name"));
				ntVO.setCreate_Date(rs.getDate("create_date"));
				ntVO.setId(rs.getString("id"));
				ntVO.setDoc_Cont(rs.getString("doc_Cont"));
				ntVO.setDel_yn(rs.getString("del_yn"));
				
				list.add(ntVO);
			}
			
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return list;
	}
	
	
	
	public int selectTotalCnt(SearchVO sVO) throws SQLException{
		int totalCnt=0;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection dbCon= DbConnection.getInstance();
		
		try {
			con =dbCon.getConn("jdbc/abn");	
			
			StringBuilder selectCnt= new StringBuilder();
			selectCnt.append(" select count(*) cnt from notice ");
			
			if(sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
				selectCnt.append("where").append(columnNames[Integer.parseInt(sVO.getField())])
					.append(" like '%'||?||'%' ");
			}
			
			pstmt= con.prepareStatement(selectCnt.toString());
			
			if(sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
				pstmt.setString(1, sVO.getKeyword());
			}
			System.out.println(selectCnt);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				totalCnt=rs.getInt("cnt");
			}
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return totalCnt;
	}
	
	
	
	
	public NoticeVO selectOne(String title) throws SQLException {
		NoticeVO ntVO=null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		
		DbConnection dbCon= DbConnection.getInstance();
		
		try {
			
			con =dbCon.getConn("jdbc/abn");			
			String selectOne=(" select * from notice where doc_No=? ");
			
			pstmt=con.prepareStatement(selectOne);
			
			pstmt.setString(1, title);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				ntVO= new NoticeVO();
				ntVO.setDoc_No(rs.getString("doc_No"));
				ntVO.setTitle(rs.getString("title"));
				ntVO.setImg_Name(rs.getString("img_Name"));
				ntVO.setCreate_Date(rs.getDate("create_date"));
				ntVO.setId(rs.getString("id"));
				ntVO.setDoc_Cont(rs.getString("doc_Cont"));
				ntVO.setDel_yn(rs.getString("del_yn"));
			}
			
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return ntVO;
	}
	
	
	
	public List<NoticeVO> selectNotice(SearchVO sVO) throws SQLException{
		List<NoticeVO> list= new ArrayList<NoticeVO>();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection dbCon= DbConnection.getInstance();
		
		try {
			con=dbCon.getConn("jdbc/abn");
			
			StringBuilder selectNotice = new StringBuilder();
			selectNotice.append(" select DOC_NO, TITLE, IMG_NAME, CREATE_DATE,ID, rnum ,del_yn ")
			.append(" from (select DOC_NO, TITLE, IMG_NAME, CREATE_DATE,ID,del_yn, ")
			.append(" row_number() over(order by create_date desc) rnum  ")
			.append(" from notice ");
			
			if(sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
				selectNotice.append(" where instr(").append(columnNames[Integer.parseInt(sVO.getField())])
				.append(", ?) > 0");
			}
			
			selectNotice.append(") where rnum between ? and ? ");
			
			pstmt= con.prepareStatement(selectNotice.toString());
			
			int bindIndex=0;
			if(sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
				pstmt.setString(++bindIndex, sVO.getKeyword());
			}
			
			pstmt.setInt(++bindIndex, sVO.getStartNum());
			pstmt.setInt(++bindIndex, sVO.getEndNum());
			
			System.out.println(selectNotice);
			
			rs=pstmt.executeQuery();
			
			NoticeVO ntVO=null;
			while(rs.next()) {
				ntVO=new NoticeVO(rs.getString("doc_no"), rs.getString("title"),rs.getString("img_name"),null
						,rs.getDate("create_date"),rs.getString("id"));
						
				list.add(ntVO);		
			}
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return list;
	}
	
	
	/**
	    * 사용자의 편의를 위해서 DB내의 max값을 가져와서 반환하는 method
	    * @return
	    * @throws SQLException
	    */
	   public String selectMaxNotice() throws SQLException {
	      String code ="";
	      StringBuilder sb= new StringBuilder("NOTI_");
	      DbConnection dbCon = DbConnection.getInstance();
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         con = dbCon.getConn("jdbc/abn");
	         String str ="select max(doc_No) doc_No from notice";
	         pstmt =con.prepareStatement(str);
	         rs =pstmt.executeQuery();
	         if(rs.next()) {
	            code =rs.getString("doc_No");
	         }
	         int num =Integer.parseInt(code.substring(5));
	         sb.append(String.format("%05d", num+1));
	         code =sb.toString();
	      }finally {
	         dbCon.closeCon(rs, pstmt, con);
	      }
	      
	      return code;
	   }
	
	
	
	
	public int insertNotice(NoticeVO ntVO) throws SQLException{
		int cnt=0;
		Connection con=null;
		PreparedStatement pstmt=null;
		
		DbConnection dbCon=DbConnection.getInstance();
		
		try {
			con=dbCon.getConn("jdbc/abn");
			String insertNotice=" insert into notice(doc_no, title, img_name, create_date, id, doc_cont, del_yn) values(?,?,?,sysdate,?,?,'N') ";
			
			pstmt=con.prepareStatement(insertNotice);
			
			pstmt.setString(1, ntVO.getDoc_No());
			pstmt.setString(2, ntVO.getTitle());
			pstmt.setString(3, ntVO.getImg_Name());
			pstmt.setString(4, ntVO.getId());
			pstmt.setString(5, ntVO.getDoc_Cont());
			
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			dbCon.closeCon(null, pstmt, con);
		}
		return cnt;
	}
	
	
	public NoticeVO selectDetail(String doc_No) throws SQLException{
		NoticeVO ntVO=null;
		
		Connection con= null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection dbCon= DbConnection.getInstance();
		
		try {
			con=dbCon.getConn("jdbc/abn");
			
			StringBuilder selectNotice= new StringBuilder();
			selectNotice.append(" select doc_no, title, img_name, create_date, id, content, del_yn ")
			.append(" from notice ")
			.append(" where doc_no=? ");
			
			pstmt=con.prepareStatement(selectNotice.toString());
			
			pstmt.setString(1, doc_No);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				StringBuilder content= new StringBuilder();
				String temp="";
				
				BufferedReader br=null;
				
				try {
					br= new BufferedReader(rs.getClob("content").getCharacterStream());
					while((temp = br.readLine()) != null) {
						content.append(temp).append("\n");
					}
					br.close();
				}catch(IOException ie) {
					ie.printStackTrace();
				}
				
				ntVO= new NoticeVO(rs.getString("doc_no"), rs.getString("title"),rs.getString("img_name")
						,content.toString(),rs.getDate("create_date"),rs.getString("del_yn"));
			}
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return ntVO;
	}
	
	
	public int updateNotice(NoticeVO ntVO) throws SQLException {
		
		int cnt=0;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		DbConnection dbCon= DbConnection.getInstance();
		
		try {
			con=dbCon.getConn("jdbc/abn");
			StringBuilder update=new StringBuilder();
			update.append(" update notice ")
			.append(" set title=?, img_Name=?, doc_Cont=? ")
			.append(" where doc_No=? ");
			
			pstmt=con.prepareStatement(update.toString());
			
			pstmt.setString(1, ntVO.getTitle());
			pstmt.setString(2, ntVO.getImg_Name());
			pstmt.setString(3, ntVO.getDoc_Cont());
			pstmt.setString(4, ntVO.getDoc_No());
			
			pstmt.executeUpdate();
		}finally {
			dbCon.closeCon(null, pstmt, con);
		}
		return cnt;
		
	}
	
	/**
	    * 사용자의 편의를 위해서 DB내의 max값을 가져와서 반환하는 method
	    * @return
	    * @throws SQLException
	    */
	   public String selectMaxNotice() throws SQLException {
	      String code ="";
	      StringBuilder sb= new StringBuilder("NOTI_");
	      DbConnection dbCon = DbConnection.getInstance();
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         con = dbCon.getConn("jdbc/abn");
	         String str ="select max(doc_No) doc_No from notice";
	         pstmt =con.prepareStatement(str);
	         rs =pstmt.executeQuery();
	         if(rs.next()) {
	            code =rs.getString("doc_No");
	         }
	         int num =Integer.parseInt(code.substring(5));
	         sb.append(String.format("%05d", num+1));
	         code =sb.toString();
	      }finally {
	         dbCon.closeCon(rs, pstmt, con);
	      }
	      
	      return code;
	   }
	
	
	public void deleteNotice(String del_yn) throws SQLException {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		DbConnection dbCon= DbConnection.getInstance();
		try {
			
			String deleteNotice=" update notice set del_yn= 'y' where doc_No=? ";
			
			pstmt=con.prepareStatement(deleteNotice);
			
			pstmt.setString(1, "doc_No");
			
			
			
		}finally {
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}
		}
	}
	

}
