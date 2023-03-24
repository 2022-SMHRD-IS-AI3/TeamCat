package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@RequiredArgsConstructor
@Getter
public class FileDTO {
	
	@NonNull private int f_idx;
	private String route_type;
	@NonNull private int post_idx;
	private String file_name;
	private String file_extension;
	private String File_location;
	private String file_size;
	
	
	
	
	
}
