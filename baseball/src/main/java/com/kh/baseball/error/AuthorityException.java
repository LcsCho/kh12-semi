package com.kh.baseball.error;
import lombok.NoArgsConstructor;
@NoArgsConstructor
public class AuthorityException extends RuntimeException{
	public AuthorityException(String message) {
		super(message);
	}
	

}
