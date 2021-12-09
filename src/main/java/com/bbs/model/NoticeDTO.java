package com.bbs.model;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDTO {

	private int notice_no;
	private String notice_title;
	private String notice_content;
	private String manager_no;
	private Date notice_reg_date;
	private int notice_view_count;
	private String notice_fix;
	
	private String manager_name;
	private String manager_id;
	private String manager_pw;
	
}
