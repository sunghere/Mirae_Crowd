package com.sung.hee.help;

import java.io.Serializable;

public class AjaxCheck implements Serializable {
	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	//{"message":getMessage()}
}
