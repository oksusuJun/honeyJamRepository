package com.honeyjam.exception;

public class DuplicatedIdException extends Exception{

	private String duplicatedId;
	public DuplicatedIdException(){}
	public DuplicatedIdException(String message){
		super(message);
	}
	public DuplicatedIdException(String message, String duplicatedId) {
		super(message);
		this.duplicatedId = duplicatedId;
	}
	public String getDuplicatedId() {
		return duplicatedId;
	}
	
	 
}
