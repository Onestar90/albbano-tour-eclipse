package vo;

public class QnaSearchVO {
	
	private String currentPage;
	private int StartNum,endNum;
	public QnaSearchVO(String currentPage, int startNum, int endNum) {
		super();
		this.currentPage = currentPage;
		this.StartNum = startNum;
		this.endNum = endNum;
	}
	public QnaSearchVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartNum() {
		return StartNum;
	}
	public void setStartNum(int startNum) {
		this.StartNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	@Override
	public String toString() {
		return "QnaSearchVO [currentPage=" + currentPage + ", StartNum=" + StartNum + ", endNum=" + endNum + "]";
	}
	
	
}
