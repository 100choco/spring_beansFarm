package com.bbs.model;

import lombok.Data;

@Data
public class CartDTO {
	
	private Long cart_no;
	private Long m_no;
	private Long p_no;
	private int op_no1;
	private int option_quantity1;
	private int op_no2;
	private int order_price;
	
//	productDTO에서 끌어다 쓸꺼
	private String p_thumbnail;
	private String p_name;
	private int p_price;
	
	private int total_price;
}
