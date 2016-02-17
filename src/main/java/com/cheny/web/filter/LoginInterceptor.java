package com.cheny.web.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cheny.web.bean.Admin;
import com.cheny.web.bean.Household;
import com.cheny.web.bean.Teacher;
public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        boolean flag = false;
        String url = request.getServletPath().toString();
        if (isUrlNoNeedRight(url)) {
            flag = true;
        } else {
            Teacher teacher = (Teacher) request.getSession().getAttribute("loginTeacher");
            Household household = (Household) request.getSession().getAttribute("loginHousehold");
            Admin admin = (Admin) request.getSession().getAttribute("loginAdmin");
            if (teacher != null || household != null || admin != null) {
                flag = true;
            } else {
                request.getRequestDispatcher("/").forward(request, response);
            }
            
        }
        return flag;
    }

    private boolean isUrlNoNeedRight(String url) {
        boolean flag = false;
        String[] urls = {
            "/teacher/login",
            "/resources/",
            "/loginCheck",
            "/teacher/register",
            "/teacher/addTeacher",
            "/teacher/getTeacherByUsername",
            "/household/login",
            "/household/register",
            "/household/addHousehold",
            "/household/getHouseholdByUsername",
            "/admin/login",
            "/admin/getAdminByUsername",
            "/admin/getAnnounceByPage",
            "/admin/announceInfoToAll"
        };
        for (int i = 0; i < urls.length; i++) {
            if (!url.equals("/") && urls[i].contains(url)) {
                flag = true;
                break;
            }
        }
        return flag;
    }
}
