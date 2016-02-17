package com.cheny.course;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cheny.household.HouseholdService;
import com.cheny.message.MessageService;
import com.cheny.web.bean.Admin;
import com.cheny.web.bean.BigCourseType;
import com.cheny.web.bean.Course;
import com.cheny.web.bean.CourseHouseholdChild;
import com.cheny.web.bean.CourseType;
import com.cheny.web.bean.Household;
import com.cheny.web.bean.Message;
import com.cheny.web.bean.ResultPage;
import com.cheny.web.bean.SmallCourseType;
import com.cheny.web.bean.Teacher;
import com.cheny.web.service.UploadService;
import com.cheny.web.util.Pager;
import com.cheny.web.util.RequestUtil;
import com.cheny.web.util.ResultMsg;

@Controller
public class CourseAction {

    @Autowired
    private CourseService courseService;
    @Autowired
    private UploadService uploadService;
    @Autowired
    private MessageService messageService;
    @Autowired
    private HouseholdService householdService;
    /**
     * 页面跳转函数
     */
//    @RequestMapping(value = "/{parentPageName/childPageName}/", method = RequestMethod.GET)
//    public ModelAndView viewAdminManagePages(HttpServletRequest request, @PathVariable("pageName") String pageName) throws Exception {
//        return new ModelAndView("/course/" + pageName, RequestUtil.getRequestParam(request));
//    }

    private String uploadAttachement(Integer id, String typeName, MultipartFile file, HttpServletRequest request) {
        try {
            String path = request.getSession().getServletContext().getRealPath("/resources/userFile/");
            /* split用正则匹配“.”是关键字，要用“\\”转义 */
            String suffix = file.getOriginalFilename().split("\\.")[1];
            String finalFilename = id + typeName + "." + suffix;
            uploadService.uploadFile(file, path, finalFilename);
            return "/resources/userFile/" + finalFilename;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 添加课程
     */
    @RequestMapping(value = "/addCourse", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg addCourse(HttpServletRequest request,
                               Course course,
                               @RequestParam(value = "courseEnvirmentFile", required = false) MultipartFile courseEnvirmentFile,
                               @RequestParam("detailExplain") String detailExplain) {
        try {
            if (courseEnvirmentFile != null) {
                Integer id = 1;
                if (courseService.getMaxIdCourse() != null) {
                    id = courseService.getMaxIdCourse().getId() + 1;
                }
                course.setCourseEnvirment(uploadAttachement(id, "courseEnvirmentFile", courseEnvirmentFile, request));
            }
            course.setDetailExplain(detailExplain);
            courseService.addCourse(course);
            return new ResultMsg(0, "添加成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "添加失败");
        }
    }

    @RequestMapping(value = "/getCourseById", method = RequestMethod.POST)
    @ResponseBody
    public Course getCourseById(@RequestParam("id") Integer id) {
        try {
            return courseService.getCourseById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    /**
     * 更改课程
     */
    @RequestMapping(value = "/updateCourse", method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public ResultMsg updateCourse(HttpServletRequest request,
                                  Course course,
                                  @RequestParam(value = "courseEnvirmentFile", required = false) MultipartFile courseEnvirmentFile,
                                  @RequestParam("detailExplain") String detailExplain) {
        try {
            if (courseEnvirmentFile != null) {
                course.setCourseEnvirment(uploadAttachement(course.getId(), "courseEnvirmentFile", courseEnvirmentFile, request));
            }
            course.setDetailExplain(detailExplain);
            //发送消息通知
            teacherSendMessageHousehold(request, course, null);
            courseService.updateCourse(course);
            return new ResultMsg(0, "更改成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "更改失败");
        }
    }

    private void teacherSendMessageHousehold(HttpServletRequest request, Course course, Integer delete) throws Exception {
        List<CourseHouseholdChild> chcList = courseService.getCourseHouseholdChildByCourseId(course.getId());
        if(chcList != null){
            for(CourseHouseholdChild chc:chcList){
                Teacher teacher = (Teacher) request.getSession().getAttribute("loginTeacher");
                if(teacher != null){
                    Household household;
                    if(chc.getHousehold() != null){
                        household = chc.getHousehold();
                    }else{
                        household = householdService.getHouseholdById(chc.getChild().getHouseholdId());
                    }
                    Course courseOld = courseService.getCourseById(course.getId());
                    Message message;
                    if(delete == null){
                        message = new Message("课程信息变动通知", "你以前预订的课程‘"+ courseOld.getTitle() + "’，当前课程‘"+ course.getTitle() + "’信息有变动，请你及时查看以免权益受损", teacher.getId(), 1, household.getId(), 2, teacher.getUsername());
                    }else{
                        householdService.deleteCourseHouseholdChild(chc.getId());//同时删除预订信息
                        message = new Message("课程删除通知", "你以前预订的课程‘"+ courseOld.getTitle() + "’已被删除，电话:" + teacher.getPhone() + "，若有权益受损，请联系我或通知管理员", teacher.getId(), 1, household.getId(), 2, teacher.getUsername());
                    }
                        messageService.addMessage(message);
                }
            }
        }
    }
    @RequestMapping(value = "/getCourseTypeByBigCourseTypeId", method = RequestMethod.POST)
    @ResponseBody
    public List<CourseType> getCourseTypeByBigCourseTypeId(@RequestParam("bigCourseTypeId") Integer bigCourseTypeId) {
        List<CourseType> courseTypeList = null;
        try {
            courseTypeList = courseService.getCourseTypeByBigCourseTypeId(bigCourseTypeId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return courseTypeList;
    }

    private boolean haveXianArray(Course course, String [] xianArray) {
        for(int i = 0; i < xianArray.length; i++) {
            if(course.getXian().indexOf(xianArray[i]) == -1){
                return false;
            }
        }
        return true;
    }

    @RequestMapping(value="/getCourseByPage", method = RequestMethod.GET)
    @ResponseBody
    public ResultPage<Course> getCourseByPage(HttpServletRequest request) {
        Pager pager = new Pager();
        List<Course> courseList = null;
        ResultPage<Course> resultPage = null;
        HashMap<String, Object> paramMap = RequestUtil.getRequestParam(request);
        if (paramMap.get("page") != null) {
            pager.setCurrentPage(Integer.parseInt(paramMap.get("page").toString()));
        }
        paramMap.put("page", pager);
        try {
            String xianStr = null;
            String bigCourseTypeId = null;
            if(paramMap.get("bigCourseTypeId") != null) {
                bigCourseTypeId = paramMap.get("bigCourseTypeId").toString();
            }
            if(bigCourseTypeId != null && bigCourseTypeId.equals("1") && paramMap.get("xian") != null){
                xianStr = paramMap.get("xian").toString();
                //大类是第一个时，县可能有多个
                paramMap.remove("xian");
                paramMap.put("xian", "");
            }
            courseList = courseService.getCourseByPage(paramMap);
            //县的code是多个时
            if(bigCourseTypeId != null && bigCourseTypeId.equals("1") && xianStr != null ){
                String [] xianArray = xianStr.split(",");
                for(int i = 0; i < courseList.size(); i++){
                    //如果县的代码没有全部包括xianArray就删除掉;
                    if(!haveXianArray(courseList.get(i), xianArray)){
                        courseList.remove(i);
                        i--;
                    }
                }
            }
            resultPage = new ResultPage<Course>(pager, courseList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultPage;
    }

    @RequestMapping(value="/deleteCourse", method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public ResultMsg deleteCourse(@RequestParam("id") Integer id,HttpServletRequest request) {
        try {
            Course course = new Course();
            course.setId(id);
            teacherSendMessageHousehold(request, course, 0);
            courseService.deleteCourse(id);
            return new ResultMsg(0, "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "删除失败");
        }
    }

    @RequestMapping(value = "/getAllBigCourseType", method = RequestMethod.POST)
    @ResponseBody
    public List<BigCourseType> getAllBigCourseType() {
        List<BigCourseType> bigCourseTypeList = null;
        try {
            bigCourseTypeList = courseService.getAllBigCourseType();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bigCourseTypeList;
    }

    @RequestMapping(value = "/getSmallCourseTypeByCourseTypeId", method = RequestMethod.POST)
    @ResponseBody
    public List<SmallCourseType> getSmallCourseTypeByCourseTypeId(@RequestParam("courseTypeId") Integer courseTypeId) {
        List<SmallCourseType> smallCourseTypeList = null;
        try {
            smallCourseTypeList = courseService.getSmallCourseTypeByCourseTypeId(courseTypeId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return smallCourseTypeList;
    }
    @RequestMapping(value = "/getCourseHouseholdChildByPage", method = RequestMethod.POST)
    @ResponseBody
    public ResultPage<CourseHouseholdChild> getCourseHouseholdChildByPage(HttpServletRequest request){
        Pager pager = new Pager();
        List<CourseHouseholdChild> courseHouseholdChildList = null;
        ResultPage<CourseHouseholdChild> resultPage = null;
        HashMap<String, Object> paramMap = RequestUtil.getRequestParam(request);
        if (paramMap.get("page") != null) {
            pager.setCurrentPage(Integer.parseInt(paramMap.get("page").toString()));
        }
        paramMap.put("page", pager);
        try {
            courseHouseholdChildList = courseService.getCourseHouseholdChildByPage(paramMap);
            resultPage = new ResultPage<CourseHouseholdChild>(pager, courseHouseholdChildList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultPage;
    }
    @RequestMapping(value = "/stopCourse", method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public ResultMsg stopCourse(HttpServletRequest request,
                                @RequestParam("id") Integer id,
                                @RequestParam("courseStatus") Integer courseStatus,
                                @RequestParam("reason") String reason){
        Course course = new Course(id, courseStatus, reason);
        Admin admin = (Admin)request.getSession().getAttribute("loginAdmin");
        if(admin.getUsername().equals("administrator")){
            course.setAdminId(0);
            admin.setId(0);
        }else{
            course.setAdminId(admin.getId());
        }
        try {
            courseService.updateCourse(course);
            Course courseInfo = courseService.getCourseById(id);
            Message messageTeacher = new Message("你发布的课程被管理员禁止", "你于"+ courseInfo.getAddTime() + "发布的课程：" + courseInfo.getTitle() + "由于" + reason + "被禁止", admin.getId(), 3, courseInfo.getTeacherId(), 1, admin.getUsername());
            messageService.addMessage(messageTeacher);
            adminMessageHousehold(id, reason, admin, courseInfo);
            return new ResultMsg(0, "禁止成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "禁止失败");
        }
    }

    private void adminMessageHousehold(Integer id, String reason, Admin admin, Course courseInfo) throws Exception {
        List<CourseHouseholdChild> chcList = courseService.getCourseHouseholdChildByCourseId(id);
        if(chcList != null){
            for(CourseHouseholdChild chc:chcList){
                    Household household;
                    if(chc.getHousehold() != null){
                        household = chc.getHousehold();
                    }else{
                        household = householdService.getHouseholdById(chc.getChild().getHouseholdId());
                    }
                    Message message;
                    householdService.deleteCourseHouseholdChild(chc.getId());//同时删除预订信息
                    message = new Message("课程禁止通知", "你以前预订的课程‘"+ courseInfo.getTitle() + "’，由于" + reason + "已被管理员禁止，若有权益受损，请联系通知管理员", admin.getId(), 3, household.getId(), 2, admin.getUsername());
                    messageService.addMessage(message);
            }
        }
    }
    
}
