package vo;

import java.util.Date;

public class ChartVO {
	
	private String CRS_CODE,CRS_NAME;
	private int PERSON;
	private Date TOUR_DATE;
	
	
	public ChartVO(String cRS_CODE, String cRS_NAME, int pERSON, Date tOUR_DATE) {
		super();
		this.CRS_CODE = cRS_CODE;
		this.CRS_NAME = cRS_NAME;
		this.PERSON = pERSON;
		this.TOUR_DATE = tOUR_DATE;
	}
	public ChartVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getCRS_CODE() {
		return CRS_CODE;
	}
	public void setCRS_CODE(String cRS_CODE) {
		CRS_CODE = cRS_CODE;
	}
	public String getCRS_NAME() {
		return CRS_NAME;
	}
	public void setCRS_NAME(String cRS_NAME) {
		CRS_NAME = cRS_NAME;
	}
	public int getPERSON() {
		return PERSON;
	}
	public void setPERSON(int pERSON) {
		PERSON = pERSON;
	}
	public Date getTOUR_DATE() {
		return TOUR_DATE;
	}
	public void setTOUR_DATE(Date tOUR_DATE) {
		TOUR_DATE = tOUR_DATE;
	}
	@Override
	public String toString() {
		return "ChartVO [CRS_CODE=" + CRS_CODE + ", CRS_NAME=" + CRS_NAME + ", PERSON=" + PERSON + ", TOUR_DATE="
				+ TOUR_DATE + "]";
	}
	
	
	
	

	
}
