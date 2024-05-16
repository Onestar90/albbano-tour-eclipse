package vo;

import java.sql.Date;

public class TourReservationVO {
	
	private String resv_code, id, crs_code, logic, crs_name;
	private int fare, person, resv_flag;
	private Date create_date, tour_date;
	
	public TourReservationVO() {
		
	}

	public TourReservationVO(String resv_code, String id, String crs_code, String logic, int fare, int person,
			int resv_flag, Date create_date) {
		super();
		this.resv_code = resv_code;
		this.id = id;
		this.crs_code = crs_code;
		this.logic = logic;
		this.fare = fare;
		this.person = person;
		this.resv_flag = resv_flag;
		this.create_date = create_date;
	}
	
	public TourReservationVO(String resv_code, String id, String crs_code, String logic, int fare, int person,
			int resv_flag, Date create_date, Date tour_date) {
		super();
		this.resv_code = resv_code;
		this.id = id;
		this.crs_code = crs_code;
		this.logic = logic;
		this.fare = fare;
		this.person = person;
		this.resv_flag = resv_flag;
		this.create_date = create_date;
		this.tour_date = tour_date;
	}

	public TourReservationVO(String resv_code, String id, String crs_name, int fare, int resv_flag, Date create_date) {
		super();
		this.resv_code = resv_code;
		this.id = id;
		this.crs_name = crs_name;
		this.fare = fare;
		this.resv_flag = resv_flag;
		this.create_date = create_date;
	}
	
	public String getCrs_name() {
		return crs_name;
	}

	public void setCrs_name(String crs_name) {
		this.crs_name = crs_name;
	}

	public Date getTour_date() {
		return tour_date;
	}

	public void setTour_date(Date tour_date) {
		this.tour_date = tour_date;
	}


	public String getResv_code() {
		return resv_code;
	}

	public void setResv_code(String resv_code) {
		this.resv_code = resv_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCrs_code() {
		return crs_code;
	}

	public void setCrs_code(String crs_code) {
		this.crs_code = crs_code;
	}

	public String getLogic() {
		return logic;
	}

	public void setLogic(String logic) {
		this.logic = logic;
	}

	public int getFare() {
		return fare;
	}

	public void setFare(int fare) {
		this.fare = fare;
	}

	public int getPerson() {
		return person;
	}

	public void setPerson(int person) {
		this.person = person;
	}

	public int getResv_flag() {
		return resv_flag;
	}

	public void setResv_flag(int resv_flag) {
		this.resv_flag = resv_flag;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	@Override
	public String toString() {
		return "TourReservationVO [resv_code=" + resv_code + ", id=" + id + ", crs_code=" + crs_code + ", logic="
				+ logic + ", fare=" + fare + ", person=" + person + ", resv_flag=" + resv_flag + ", create_date="
				+ create_date + "]";
	}
	
	
	
	
	
	
}
