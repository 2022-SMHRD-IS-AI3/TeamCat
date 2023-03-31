package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
public class MessageDTO {
	   
	   private int ms_idx;
	   private int p_idx;
	   private int user_idx;
	   private int send_idx;
	   private String message_con;
	   private String ms_reg_date;
	   private String ms_nick; //보낸사람
	   private String mr_nick; // 받은사람
	   
	public MessageDTO(int ms_idx, int p_idx, int user_idx, int send_idx, String message_con, String ms_reg_date) {
		super();
		this.ms_idx = ms_idx;
		this.p_idx = p_idx;
		this.user_idx = user_idx;
		this.send_idx = send_idx;
		this.message_con = message_con;
		this.ms_reg_date = ms_reg_date;
	}
	   
	   
}

