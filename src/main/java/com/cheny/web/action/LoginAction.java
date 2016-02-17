package com.cheny.web.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cheny.admin.AdminService;
import com.cheny.household.HouseholdService;
import com.cheny.teacher.TeacherService;
import com.cheny.web.bean.Admin;
import com.cheny.web.bean.Household;
import com.cheny.web.bean.Teacher;
import com.cheny.web.util.RequestUtil;
import com.cheny.web.util.ResultMsg;

@Controller
public class LoginAction {

    @Autowired
    private TeacherService teacherService;
    @Autowired
    private HouseholdService householdService;
    @Autowired
    private AdminService adminService;

    @RequestMapping(value="/loginCheck", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg loginCheck(HttpServletRequest request,@RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("userType") Integer userType) {
        switch (userType) {
            case 1:
                Teacher teacher = null;
                try {
                    teacher = teacherService.getTeacherByUsername(username);
                    if(teacher != null) {
                        if(teacher.getPassword().equals(password)){
                            if(teacher.getStatus() == 3) {
                                return new ResultMsg(1, "你的帐号已被禁用");
                            }
                            HttpSession session = request.getSession();
                            session.setAttribute("loginTeacher", teacher);
                            return new ResultMsg(0, "登录成功");
                        }
                    }
                    return new ResultMsg(1, "用户名或密码错误");
                } catch (Exception e) {
                    e.printStackTrace();
                    return new ResultMsg(0, "服务器错误");
                }
            case 2:
                Household household = null;
                try {
                    household = householdService.getHouseholdByUsername(username);
                    if(household != null) {
                        if(household.getPassword().equals(password)){
                            HttpSession session = request.getSession();
                            session.setAttribute("loginHousehold", household);
                            return new ResultMsg(0, "登录成功");
                        }
                    }
                    return new ResultMsg(1, "用户名或密码错误");
                } catch (Exception e) {
                    e.printStackTrace();
                    return new ResultMsg(0, "服务器错误");
                }
            case 3:
                Admin admin = null;
                try {
                    if(username.equals("administrator")) {
                        String filePath = RequestUtil.getResourcePath("config.properties");
                        if (password.equals(adminService.getAdministratorPassword(filePath))) {
                            HttpSession session = request.getSession();
                            admin = new Admin();
                            admin.setUsername("administrator");
                            session.setAttribute("loginAdmin", admin);
                            return new ResultMsg(0, "登录成功");
                        }
                    } else {
                        admin = adminService.getAdminByUsername(username);
                        if(admin != null) {
                            if(admin.getPassword().equals(password)){
                                HttpSession session = request.getSession();
                                session.setAttribute("loginAdmin", admin);
                                return new ResultMsg(0, "登录成功");
                            }
                        }
                    }
                    return new ResultMsg(1, "用户名或密码错误");
                } catch (Exception e) {
                    e.printStackTrace();
                    return new ResultMsg(0, "服务器错误");
                }
            default:
                return null;
        }
    }
    @RequestMapping(value="/loginOut")
    public void loginOut(HttpServletRequest request, HttpServletResponse response, @RequestParam("userType") Integer userType) throws ServletException, IOException {
        switch (userType) {
            case 1:
                HttpSession session1 = request.getSession();
                session1.invalidate();
                response.sendRedirect("/");
                break;
            case 2:
                HttpSession session2 = request.getSession();
                session2.invalidate();
                response.sendRedirect("/");
                break;
            case 3:
                HttpSession session3 = request.getSession();
                session3.invalidate();
                response.sendRedirect("/");
                break;
            default:
                response.sendRedirect("/");
                break;
        }
    }
}
