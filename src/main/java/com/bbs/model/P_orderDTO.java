package com.bbs.model;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class P_orderDTO {
	private Long order_no;
	private Long m_no;
	private Long c_no;
	private String postnum;
	private String address;
	private String detailed_address;
	private String recipient_name;
	private String recipient_phone;
	private int point_use;
	private int order_price;
	private Timestamp order_reg_date;
	private Long p_no;
	private int op_no1;
	private int option_quantity1;
	private int op_no2;
	private String p_return;
	
}
