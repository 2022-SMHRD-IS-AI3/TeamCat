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
	private String reg_date;
	private String user_flag;
	private String file_name;
	
	
	public UserDTO(int user_idx, String nick, String gender, String kakao_id, String reg_date,
			String user_flag, String file_name) {
		this.user_idx = user_idx;
		this.nick = nick;
		this.gender = gender;
		this.kakao_id = kakao_id;
		this.reg_date = reg_date;
		this.user_flag = user_flag;
		this.file_name = file_name;
	}


	public UserDTO(int user_idx, String nick) {
		super();
		this.user_idx = user_idx;
		this.nick = nick;
	}


	public UserDTO(String kakao_id) {
		super();
		this.kakao_id = kakao_id;
	}
	
}
