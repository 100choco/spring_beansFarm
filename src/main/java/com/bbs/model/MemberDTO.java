package com.bbs.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class MemberDTO {
	private Long m_no;
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_phone;
	private String m_postnum;
	private String m_address;
	private String m_detailed_address;
	private int m_point;
	private Timestamp m_reg_date;
	private String m_email;
	private String m_leave;
	
	private int membership_no;
	private String membership_name;
	
}
