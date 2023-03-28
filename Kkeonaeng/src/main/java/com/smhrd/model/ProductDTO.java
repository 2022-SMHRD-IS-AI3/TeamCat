package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
@AllArgsConstructor
public class ProductDTO {
	
	private int p_idx;
	private int user_idx;
	private String p_name;
	private int c_idx;
	private String contact_addr;
	private String contact_gps;
	private int price;
	private String p_contents;
	private String p_reg_date;
	private String p_flag;
	private String nick;
	

}
