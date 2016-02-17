package com.cheny.teacher;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cheny.course.CourseService;
import com.cheny.web.bean.BigCourseType;
import com.cheny.web.bean.Course;
import com.cheny.web.bean.CourseHouseholdChild;
import com.cheny.web.bean.Teacher;
import com.cheny.web.service.UploadService;
import com.cheny.web.util.RequestUtil;
import com.cheny.web.util.ResultMsg;

@Controller
@RequestMapping(value = "/teacher")
public class TeacherAction {

    @Autowired
    TeacherService teacherService;
    @Autowired
    CourseService courseService;
    @Autowired
    private UploadService uploadService;

    /**
     * 页面跳转函数
     */
    @RequestMapping(value = "/{pageName}", method = RequestMethod.GET)
    public ModelAndView viewAdminManagePages(HttpServletRequest request, @PathVariable("pageName") String pageName) throws Exception {
        HashMap<String,Object> hashMap = RequestUtil.getRequestParam(request);
        if(pageName.equals("chooseBigCourseType")){
            List<BigCourseType> bigCourseTypeList = courseService.getAllBigCourseType();
            hashMap.put("bigCourseTypeList", bigCourseTypeList);
        }else if(pageName.equals("courseInfo") || pageName.equals("editCourse")){
            Course course = courseService.getCourseById(Integer.parseInt(hashMap.get("id").toString()));
            hashMap.put("course", course);
            List<CourseHouseholdChild> courseHouseholdChildList = courseService.getCourseHouseholdChildByCourseId(Integer.parseInt(hashMap.get("id").toString()));
            hashMap.put("courseHouseholdChildList", courseHouseholdChildList);
        }
        return new ModelAndView("/teacher/" + pageName, hashMap);
    }

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
     * 添加教师
     */
    @RequestMapping(value = "/addTeacher", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg addTeacher(HttpServletRequest request,
                                Teacher teacher,
                                @RequestParam(value = "idCardAttacheFile", required = false) MultipartFile idCardAttacheFile,
                                @RequestParam(value = "uploadPictureFile", required = false) MultipartFile uploadPictureFile) {
        try {
            if (idCardAttacheFile != null || uploadPictureFile != null) {
                Integer id = 1;
                if (teacherService.getMaxIdTeacher() != null) {
                    id = teacherService.getMaxIdTeacher().getId() + 1;
                }
                if (idCardAttacheFile != null) {
                    teacher.setIdCardAttache(uploadAttachement(id, "idCardAttacheFile", idCardAttacheFile, request));
                }
                if (uploadPictureFile != null) {
                    teacher.setUploadPicture(uploadAttachement(id, "teacherUploadPictureFile", uploadPictureFile, request));
                }
            }
            teacherService.addTeacher(teacher);
            return new ResultMsg(0, "添加成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "添加失败");
        }
    }

    /**
     * 
     */
    @RequestMapping(value = "/getTeacherByUsername", method = RequestMethod.POST)
    @ResponseBody
    public Teacher getTeacherByUsername(@RequestParam("username") String username) {
        try {
            return teacherService.getTeacherByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping(value = "/getTeacherById", method = RequestMethod.POST)
    @ResponseBody
    public Teacher getTeacherById(@RequestParam("id") Integer id) {
        try {
            return teacherService.getTeacherById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg updatePassword(Teacher teacher, @RequestParam("pd") String pd) {
        ResultMsg resultMsg = null;
        try {
            if (pd.equals(teacherService.getTeacherById(teacher.getId()).getPassword())) {
                teacherService.updatePassword(teacher);
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

    /**
     * 更改教师
     */
    @RequestMapping(value = "/updateTeacher", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg updateTeacher(HttpServletRequest request,
                                   Teacher teacher,
                                   @RequestParam(value = "idCardAttacheFile", required = false) MultipartFile idCardAttacheFile,
                                   @RequestParam(value = "uploadPictureFile", required = false) MultipartFile uploadPictureFile) {
        try {
            if (idCardAttacheFile != null) {
                Integer id = teacher.getId();
                teacher.setIdCardAttache(uploadAttachement(id, "idCardAttacheFile", idCardAttacheFile, request));
            }
            if (uploadPictureFile != null) {
                Integer id = teacher.getId();
                teacher.setUploadPicture(uploadAttachement(id, "teacherUploadPictureFile", uploadPictureFile, request));
            }
            teacher.setStatus(0);
            teacherService.updateTeacher(teacher);
            HttpSession session = request.getSession();
            Teacher teacherSession = teacherService.getTeacherById(teacher.getId());
            session.setAttribute("loginTeacher", teacherSession);
            return new ResultMsg(0, "添加成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "添加失败");
        }
    }

}
