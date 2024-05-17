package vo;

import java.sql.Date;

public class RestaurantReviewVO {

	private String res_doc_no ,res_code, res_title, id, star, res_contents, res_name;
	private Date create_date;
	
	public RestaurantReviewVO() {
		super();
		
	}

	public RestaurantReviewVO(String res_doc_no, String res_code, String res_title, String id, String star,
			String res_contents, Date create_date) {
		super();
		this.res_doc_no = res_doc_no;
		this.res_code = res_code;
		this.res_title = res_title;
		this.id = id;
		this.star = star;
		this.res_contents = res_contents;
		this.create_date = create_date;
	}

	
	public RestaurantReviewVO(String res_doc_no, String res_title, String id, String star, String res_name) {
		super();
		this.res_doc_no = res_doc_no;
		this.res_title = res_title;
		this.id = id;
		this.star = star;
		this.res_name = res_name;
	}
	
	public String getRes_name() {
		return res_name;
	}

	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}

	public String getRes_doc_no() {
		return res_doc_no;
	}

	public void setRes_doc_no(String res_doc_no) {
		this.res_doc_no = res_doc_no;
	}

	public String getRes_code() {
		return res_code;
	}

	public void setRes_code(String res_code) {
		this.res_code = res_code;
	}

	public String getRes_title() {
		return res_title;
	}

	public void setRes_title(String res_title) {
		this.res_title = res_title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public String getRes_contents() {
		return res_contents;
	}

	public void setRes_contents(String res_contents) {
		this.res_contents = res_contents;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	@Override
	public String toString() {
		return "RestaurantReviewVO [res_doc_no=" + res_doc_no + ", res_code=" + res_code + ", res_title=" + res_title
				+ ", id=" + id + ", star=" + star + ", res_contents=" + res_contents + ", create_date="
				+ create_date + "]";
	}
	
	
	
	
	
	
}
