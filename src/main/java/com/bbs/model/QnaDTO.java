package com.bbs.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class QnaDTO {
	
	private Long q_no;
	private String q_title;
	private String q_content;
	private String q_image;
	private Long m_no;
	private Date q_reg_date;
	private int ic_no;
	private int manager_no;
	private String q_status;
	private String q_answer;
	private Date q_answer_date;
	private MemberDTO memberdto;
	private String m_name;
	
	
	
	
	private Inquiry_classificationDTO inquiry;
	private String ic_name;
	
	
	
	
	
	private ManagerDTO managerdto;
	private String manager_name;
	
}
