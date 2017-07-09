package com.sung.hee.help;

import com.sung.hee.user.model.SHUser;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by SungHere on 2017-07-09.
 */
public class SHUtil {

    public static SHUser getLogin(HttpServletRequest request) {


        return (SHUser) request.getSession().getAttribute("login");

    }
}
