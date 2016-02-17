package com.cheny.admin;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cheny.course.CourseService;
import com.cheny.message.MessageService;
import com.cheny.teacher.TeacherService;
import com.cheny.web.bean.Admin;
import com.cheny.web.bean.Announce;
import com.cheny.web.bean.Course;
import com.cheny.web.bean.CourseHouseholdChild;
import com.cheny.web.bean.DateNum;
import com.cheny.web.bean.Message;
import com.cheny.web.bean.ResultPage;
import com.cheny.web.bean.Teacher;
import com.cheny.web.service.UploadService;
import com.cheny.web.util.Pager;
import com.cheny.web.util.RequestUtil;
import com.cheny.web.util.ResultMsg;

@Controller
@RequestMapping(value = "/admin")
public class AdminAction {

    @Autowired
    private AdminService adminService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private UploadService uploadService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private MessageService messageService;

    /**
     * 页面跳转函数
     */
    @RequestMapping(value = "/{pageName}", method = RequestMethod.GET)
    public ModelAndView viewAdminManagePages(HttpServletRequest request, @PathVariable("pageName") String pageName) throws Exception {
        HashMap<String,Object> hashMap = RequestUtil.getRequestParam(request);
        if(pageName.equals("courseInfo")){
            Course course = courseService.getCourseById(Integer.parseInt(hashMap.get("id").toString()));
            hashMap.put("course", course);
            List<CourseHouseholdChild> courseHouseholdChildList = courseService.getCourseHouseholdChildByCourseId(Integer.parseInt(hashMap.get("id").toString()));
            hashMap.put("courseHouseholdChildList", courseHouseholdChildList);
        }else if(pageName.equals("editAnnounce") || pageName.equals("announceInfo") || pageName.equals("announceInfoToAll")){
            Announce announce = adminService.getAnnounceById(Integer.parseInt(hashMap.get("id").toString()));
            hashMap.put("announce", announce);
        }
        return new ModelAndView("/admin/" + pageName, hashMap);
    }

    /**
     * 添加管理员
     */
    @RequestMapping(value = "/addAdmin", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg addAdmin(HttpServletRequest request, Admin admin) {
        try {
            adminService.addAdmin(admin);
            return new ResultMsg(0, "添加成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "添加失败");
        }
    }

    /**
     * 
     */
    @RequestMapping(value = "/getAdminByUsername", method = RequestMethod.POST)
    @ResponseBody
    public Admin getAdminByUsername(@RequestParam("username") String username) {
        try {
            if(username.equals("administrator")) {
                return new Admin();
            }
            return adminService.getAdminByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping(value = "/getAdminById", method = RequestMethod.POST)
    @ResponseBody
    public Admin getAdminById(@RequestParam("id") Integer id) {
        try {
            return adminService.getAdminById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg updatePassword(Admin admin, @RequestParam("pd") String pd) {
        ResultMsg resultMsg = null;
        try {
            String filePath = RequestUtil.getResourcePath("config.properties");
            String administratorPassword = adminService.getAdministratorPassword(filePath);
            if (admin.getUsername().equals("administrator") && administratorPassword.equals(pd)){
                adminService.setAdministratorPassword(filePath, admin.getPassword());
                resultMsg = new ResultMsg(0, "更改成功");
            } else if (!admin.getUsername().equals("administrator") && pd.equals(adminService.getAdminById(admin.getId()).getPassword())) {
                adminService.updatePassword(admin);
                resultMsg = new ResultMsg(0, "更改成功");
            } else {
                resultMsg = new ResultMsg(1, "原密码错误");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resultMsg = new ResultMsg(1, "服务器出错");
        }
        return resultMsg;
    }

    @RequestMapping(value="/getAdminByPage", method = RequestMethod.GET)
    @ResponseBody
    public ResultPage<Admin> getAdminByPage(HttpServletRequest request) {
        Pager pager = new Pager();
        List<Admin> adminList = null;
        ResultPage<Admin> resultPage = null;
        HashMap<String, Object> paramMap = RequestUtil.getRequestParam(request);
        if (paramMap.get("page") != null) {
            pager.setCurrentPage(Integer.parseInt(paramMap.get("page").toString()));
        }
        paramMap.put("page", pager);
        try {
            adminList = adminService.getAdminByPage(paramMap);
            resultPage = new ResultPage<Admin>(pager, adminList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultPage;
    }

    /**
     * 更改管理员
     */
    @RequestMapping(value = "/updateAdmin", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg updateAdmin(HttpServletRequest request, Admin admin) {
        try {
            adminService.updateAdmin(admin);
            return new ResultMsg(0, "修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "修改失败");
        }
    }

    /**
     * 删除管理员（真删除）
     */
    @RequestMapping(value = "/deleteAdmin", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg deleteAdmin(@RequestParam("id") Integer id) {
        try {
            adminService.deleteAdmin(id);
            return new ResultMsg(0, "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "删除失败");
        }
    }

    /**
     * 重置管理员密码为6个6
     */
    @RequestMapping(value = "/resetAdminPassword", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg resetAdminPassword(@RequestParam("id") Integer id) {
        Admin admin = new Admin();
        admin.setId(id);
        admin.setUpdateUser("administrator");
        admin.setPassword("f379eaf3c831b04de153469d1bec345e");
        try {
            adminService.updateAdmin(admin);
            return new ResultMsg(0, "重置成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "重置失败");
        }
    }

    /**
     * 教师列表
     */
    @RequestMapping(value = "/getTeacherByPage", method = RequestMethod.POST)
    @ResponseBody
    public ResultPage<Teacher> getTeacherByPage(HttpServletRequest request) {
        List<Teacher> teacherList = null;
        Pager pager = new Pager();
        HashMap<String, Object> paramMap = RequestUtil.getRequestParam(request);
        if(paramMap.get("page").toString() != null) {
            pager.setCurrentPage(Integer.parseInt(paramMap.get("page").toString()));
        }
        paramMap.put("page", pager);
        try {
            teacherList = teacherService.getTeacherByPage(paramMap);
            ResultPage<Teacher> resultPage = new ResultPage<Teacher>(pager, teacherList);
            return resultPage;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 更改教师状态
     */
    @RequestMapping(value = "/updateTeacherStatus", method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public ResultMsg updateTeacherStatus(HttpServletRequest request,@RequestParam("id") Integer id, @RequestParam("status") Integer status, @RequestParam(value="failReason", required = false) String failReason)  {
        Teacher teacher = new Teacher(id, status);
        if(failReason != null) {
            teacher.setFailReason(failReason);
        }
        try {
            teacherService.updateTeacher(teacher);
            String title;
            String content;
            if(status == 1){
                title = "审核通过通知";
                content = "你的用户审核已通过，现在可以提交课程了";
            }else {
                title = "审核失败通知";
                content = "你的用户审核失败，因为" + failReason;
            }
            Admin admin = (Admin) request.getSession().getAttribute("loginAdmin");
            Integer sendUserId;
            if(admin.getUsername().equals("adminisitrator")){
                sendUserId = 0;
            }else{
                sendUserId = admin.getId();
            }
            Message message = new Message(title, content, sendUserId, 3, id, 1, admin.getUsername());
            messageService.addMessage(message);
            return new ResultMsg(0, "操作成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "操作失败");
        }
    }

    /**
     * 删除教师
     */
    @RequestMapping(value = "/deleteTeacher", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg deleteTeacher(@RequestParam("id") Integer id) {
        try {
            teacherService.deleteTeacher(id);
            return new ResultMsg(0, "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "删除失败");
        }
    }

//    /**
//     * 数据统计
//     */
//    @RequestMapping(value = "/getNewAddNum", method = RequestMethod.POST)
//    @ResponseBody
//    public List<DateNum> getNewAddNum(HttpServletRequest request) {
//        HashMap<String, Object> hashMap = RequestUtil.getRequestParam(request);
//        List<DateNum> dateNumList = null;
//        try {
//            dateNumList = adminService.getNewAddNum(hashMap);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return dateNumList;
//    }

    /**
     * 数据统计
     */
    @RequestMapping(value = "/getNewAddNum", method = RequestMethod.POST)
    @ResponseBody
    public List<DateNum> getNewAddNum(HttpServletRequest request) {
        HashMap<String, Object> hashMap = RequestUtil.getRequestParam(request);
        List<DateNum> dateNumList = null;
        try {
            if(hashMap.get("date") != null){
                if(!hashMap.get("date").toString().equals("")){
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
                    Date date = sdf.parse(hashMap.get("date").toString());
                    // 获取Calendar  
                    Calendar calendar = Calendar.getInstance();  
                    // 设置时间,当前时间不用设置  
                     calendar.setTime(date);  
                    // 设置日期为本月最大日期  
                    calendar.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DATE));  
                    // 打印  
                    DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                    Integer maxDay = Integer.parseInt(format.format(calendar.getTime()).toString().substring(8, 10));
                    dateNumList = new ArrayList<DateNum>();
                    for(int i = 1; i <= maxDay; i++){
                        //不足2位自动补0
                        String day = hashMap.get("date").toString().substring(0, 7) + "-" + String.format("%02d", i);
                        hashMap.put("date", day);
                        DateNum dateNum = adminService.getNumByDate(hashMap);
                        dateNum.setDate(hashMap.get("date").toString());
                        dateNumList.add(dateNum);
                    }
                }else {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
                    Date date = new Date();
                    // 获取Calendar  
                    Calendar calendar = Calendar.getInstance();  
                    // 设置时间,当前时间不用设置  
//                     calendar.setTime(date);  
                    // 设置日期为本月最大日期  
                    calendar.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DATE));  
                    // 打印  
                    DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                    Integer maxDay = Integer.parseInt(format.format(calendar.getTime()).toString().substring(8, 10));
                    dateNumList = new ArrayList<DateNum>();
                    for(int i = 1; i <= maxDay; i++){
                        //不足2位自动补0
                        String day = sdf.format(date) + "-" + String.format("%02d", i);
                        hashMap.put("date", day);
                        DateNum dateNum = adminService.getNumByDate(hashMap);
                        dateNum.setDate(hashMap.get("date").toString());
                        dateNumList.add(dateNum);
                    }
                }
            } 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dateNumList;
    }
    @RequestMapping(value = "/addAnnounce", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg addAnnounce(HttpServletRequest request, Announce announce) {
        try {
            adminService.addAnnounce(announce);
            return new ResultMsg(0, "添加成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "添加失败");
        }
    }

    @RequestMapping(value = "/getAnnounceById", method = RequestMethod.POST)
    @ResponseBody
    public Announce getAnnounceById(@RequestParam("id") Integer id) {
        try {
            return adminService.getAnnounceById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping(value="/getAnnounceByPage", method = RequestMethod.GET)
    @ResponseBody
    public ResultPage<Announce> getCourseByPage(HttpServletRequest request) {
        Pager pager = new Pager();
        List<Announce> announceList = null;
        ResultPage<Announce> resultPage = null;
        HashMap<String, Object> paramMap = RequestUtil.getRequestParam(request);
        if (paramMap.get("page") != null) {
            pager.setCurrentPage(Integer.parseInt(paramMap.get("page").toString()));
        }
        paramMap.put("page", pager);
        try {
            announceList = adminService.getAnnounceByPage(paramMap);
            resultPage = new ResultPage<Announce>(pager, announceList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultPage;
    }

    /**
     * 更改管理员
     */
    @RequestMapping(value = "/updateAnnounce", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg updateAnnounce(HttpServletRequest request, Announce announce) {
        try {
            adminService.updateAnnounce(announce);
            return new ResultMsg(0, "修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "修改失败");
        }
    }

    /**
     * 删除管理员（真删除）
     */
    @RequestMapping(value = "/deleteAnnounce", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg deleteAnnounce(@RequestParam("id") Integer id) {
        try {
            adminService.deleteAnnounce(id);
            return new ResultMsg(0, "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "删除失败");
        }
    }
}
