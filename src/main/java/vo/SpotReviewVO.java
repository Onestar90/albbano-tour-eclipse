package vo;

import java.util.Date;

public class SpotReviewVO {
	

	private String spot_doc_no, spot_code, spot_title, img_name, id, spot_contents;
	private Date create_date, edit_date;
	
	public SpotReviewVO() {
		
	}

	public SpotReviewVO(String spot_doc_no, String spot_code, String spot_title, String img_name, String id,
			String spot_contents, Date create_date, Date edit_date) {
		super();
		this.spot_code = spot_code;
		this.img_name = img_name;
		this.create_date = create_date;
		this.spot_doc_no = spot_doc_no;
		this.spot_title = spot_title;
		this.id = id;
		this.spot_contents = spot_contents;
		this.edit_date = edit_date;
	}

	public String getSpot_doc_no() {
		return spot_doc_no;
	}

	public void setSpot_doc_no(String spot_doc_no) {
		this.spot_doc_no = spot_doc_no;
	}

	public String getSpot_code() {
		return spot_code;
	}

	public void setSpot_code(String spot_code) {
		this.spot_code = spot_code;
	}

	public String getSpot_title() {
		return spot_title;
	}

	public void setSpot_title(String spot_title) {
		this.spot_title = spot_title;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSpot_contents() {
		return spot_contents;
	}

	public void setSpot_contents(String spot_contents) {
		this.spot_contents = spot_contents;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public Date getEdit_date() {
		return edit_date;
	}

	public void setEdit_date(Date edit_date) {
		this.edit_date = edit_date;
	}

	
	
	
}
