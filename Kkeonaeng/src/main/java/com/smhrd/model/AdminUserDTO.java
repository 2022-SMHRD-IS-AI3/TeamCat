package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
public class AdminUserDTO {

	private String good_cnt;
	private String bad_cnt;
	private int rp_flag_cnt;
	private int user_idx;
	private String nick;
	private String gender; 
	private String kakao_id;
	private String reg_date;
	private String user_flag;
	private int rg_idx;
	
}
