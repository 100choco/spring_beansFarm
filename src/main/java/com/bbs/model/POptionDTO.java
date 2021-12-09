package com.bbs.model;

import lombok.Data;

@Data
public class POptionDTO {
	private int op_no;
	private long p_no;
	private String op_name;
	private int op_price;
	private int op_stock;
	private int oc_no;
}
