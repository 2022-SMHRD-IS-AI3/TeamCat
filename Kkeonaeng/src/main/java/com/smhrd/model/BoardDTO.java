package com.smhrd.model;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public class BoardDTO {
	
	private int b_idx;
	private int user_idx;
	private String b_title;
	private String b_content;
	private String b_reg_date;
	private String file_name;
	

}
