package util;

public class BoardUtil {
	private static BoardUtil bu;
	
	private BoardUtil() {
	}
	
	public static BoardUtil getInstance() {
		if(bu == null) {
			bu=new BoardUtil();
		}//end if
		return bu;
	}//getInstance
	
	public String pageNation(String url,String param, int totalPage, int currentPage) {
		
		StringBuilder pageNation=new StringBuilder();
	 	int pageNumber=3;
		int startPage=((currentPage-1)/pageNumber)*pageNumber+1;			
		int endPage=(((startPage-1)+pageNumber)/pageNumber)*pageNumber;
		if(totalPage <= endPage ){
			endPage=totalPage;
		}//end if
		
		String prevMark="[ << ]";
		int movePage=0;
		
		if(currentPage > pageNumber){ //시작페이지보다 1적은 페이지로 이동
			movePage=startPage-1;
			prevMark="[ <a href='"+url+"?currentPage="+movePage+param+"'> &lt;&lt; </a> ]";
		}//end if
		
		pageNation.append( prevMark ).append(" ... ");
				
		movePage=startPage;
		while(  movePage <= endPage ){
			if( movePage == currentPage){//현재 페이지에 대해서는 링크를 생성하지 않는다.
				pageNation.append("[ <span style='font-size:20px'>")
				.append(currentPage).append("</span> ]");
			}else{
				pageNation.append("[ <a href='").append(url)
				.append("?currentPage=").append(movePage).append(param).append("'>")
						.append( movePage).append("</a> ]");
			}//end else
			movePage++;
		}//end while
		 
		String endMark="[ &gt;&gt; ]";
		if( totalPage > endPage ){
			movePage = endPage+1;
			endMark="[ <a href='board_list.jsp?currentPage="+movePage+param
					+"'> &gt;&gt;</a> ]";
		}//end if

		pageNation.append(" ... ").append( endMark );
		
		return pageNation.toString();
	}
	
}//class
