package com.medialounge.reevo.util;

import java.util.ArrayList;
import java.util.Date;

import com.medialounge.reevo.dto.ChatDto;

public class Time {
	public static void main(String[] args) {
		ArrayList<ChatDto> dto = new ArrayList<ChatDto>();
		ChatDto chatDTO = new ChatDto();
		chatDTO.setCreated(new Date());
		dto.add(chatDTO);

		for (ChatDto chat : dto) {
			
			System.out.println(chat.getCreated());
		}

		
		//------------
	}
}
