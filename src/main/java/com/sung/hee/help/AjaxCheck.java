package com.sung.hee.help;

import java.io.Serializable;

public class AjaxCheck implements Serializable {
    private String message;

    private int resultNum;

    public int getResultNum() {
        return resultNum;
    }

    public void setResultNum(int resultNum) {
        this.resultNum = resultNum;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    //{"message":getMessage()}
}
