package vo;

import java.sql.Date;

public class NoticeVO {
	private String doc_No, title, img_Name, id, doc_Cont, del_yn;
	private Date create_Date;
	private int num;
	
	
	public NoticeVO() {
		
	}
	public NoticeVO(String string, String string2, String string3, Object object, Date date, String string4) {
	}

	public NoticeVO(int num,String doc_No, String title, String img_Name, String id, String doc_Cont, String del_yn,
			Date create_Date) {
		this.doc_No = doc_No;
		this.title = title;
		this.img_Name = img_Name;
		this.id = id;
		this.doc_Cont = doc_Cont;
		this.del_yn = del_yn;
		this.create_Date = create_Date;
		this.num=num;
	}

	/**
	 * @return the doc_No
	 */
	public String getDoc_No() {
		return doc_No;
	}

	/**
	 * @param doc_No the doc_No to set
	 */
	public void setDoc_No(String doc_No) {
		this.doc_No = doc_No;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the img_Name
	 */
	public String getImg_Name() {
		return img_Name;
	}

	/**
	 * @param img_Name the img_Name to set
	 */
	public void setImg_Name(String img_Name) {
		this.img_Name = img_Name;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the doc_Cont
	 */
	public String getDoc_Cont() {
		return doc_Cont;
	}

	/**
	 * @param doc_Cont the doc_Cont to set
	 */
	public void setDoc_Cont(String doc_Cont) {
		this.doc_Cont = doc_Cont;
	}

	/**
	 * @return the del_yn
	 */
	public String getDel_yn() {
		return del_yn;
	}

	/**
	 * @param string the del_yn to set
	 */
	public void setDel_yn(String string) {
		this.del_yn = string;
	}

	/**
	 * @return the create_Date
	 */
	public Date getCreate_Date() {
		return create_Date;
	}

	/**
	 * @param create_Date the create_Date to set
	 */
	public void setCreate_Date(Date create_Date) {
		this.create_Date = create_Date;
	}
	

	/**
	 * @return the num
	 */
	public int getNum() {
		return num;
	}

	/**
	 * @param num the num to set
	 */
	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "NoticeVO [doc_No=" + doc_No + ", title=" + title + ", img_Name=" + img_Name + ", id=" + id
				+ ", doc_Cont=" + doc_Cont + ", del_yn=" + del_yn + ", create_Date=" + create_Date + ", num=" + num
				+ "]";
	}
	
	
	
	
	
}
