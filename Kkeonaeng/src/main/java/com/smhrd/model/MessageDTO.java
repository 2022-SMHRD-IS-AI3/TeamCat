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
	   
	private int num;
	   @NonNull int ms_idx;
	   @NonNull private int user_idx;
	   private int p_idx;
	   @NonNull private int send_idx;
	   @NonNull private String message_con;
	   @NonNull private String ms_reg_date;
	   private String ms_nick; //보낸사람
	   private String mr_nick; // 받은사람
}

