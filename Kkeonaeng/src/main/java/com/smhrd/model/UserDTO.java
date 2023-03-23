package com.smhrd.model;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor

public class UserDTO {
	
	private int user_idx;
	private String nick;
	private String gender; 
	private String kakao_id;
	private int kimg_idx;
	private String reg_date;
	private String user_flag;
	
	
	public UserDTO(int user_idx, String nick, String gender, String kakao_id, int kimg_idx, String reg_date,
			String user_flag) {
		this.user_idx = user_idx;
		this.nick = nick;
		this.gender = gender;
		this.kakao_id = kakao_id;
		this.kimg_idx = kimg_idx;
		this.reg_date = reg_date;
		this.user_flag = user_flag;
	}


	public UserDTO(int user_idx, String nick, int kimg_idx) {
		super();
		this.user_idx = user_idx;
		this.nick = nick;
		this.kimg_idx = kimg_idx;
	}


	public UserDTO(String kakao_id) {
		super();
		this.kakao_id = kakao_id;
	}
	
}
