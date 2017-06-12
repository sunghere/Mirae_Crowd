package com.sung.hee.exception;

import org.springframework.dao.DataAccessException;

/**
 * Created by SungHere on 2017-04-19.
 */
public class SHException extends DataAccessException {
    public SHException(String msg) {
        super(msg);
    }

    public SHException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public SHException() {
        super("SH Exception !");
    }
}
