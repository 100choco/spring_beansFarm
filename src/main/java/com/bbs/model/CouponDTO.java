package com.bbs.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CouponDTO {
	private List<String> m_noList;
	private Long c_no;
	private Long m_no;
	private String c_name;
	private Date c_reg_date;
	private Date c_expiration_date;
	private int date;   // 만료일자의 가운데 숫자  date_add(now(),INTERVAL 30 DAY
	private String c_content;
	private int c_discount;
	private String c_use;
	
}
