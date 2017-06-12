package com.sung.hee.kakao.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Keyboard implements Serializable {
    private String type;
    private List<String> buttons = new ArrayList();

    public void addButtons(String msg) {
        buttons.add(msg);
    }

    public List<String> getButtons() {
        return buttons;
    }

    public void setButtons(List<String> buttons) {
        this.buttons = buttons;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }


}
