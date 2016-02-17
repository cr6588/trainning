package com.cheny.household;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cheny.course.CourseService;
import com.cheny.message.MessageService;
import com.cheny.web.bean.Child;
import com.cheny.web.bean.Course;
import com.cheny.web.bean.CourseHouseholdChild;
import com.cheny.web.bean.Household;
import com.cheny.web.bean.Message;
import com.cheny.web.bean.ResultPage;
import com.cheny.web.service.UploadService;
import com.cheny.web.util.Pager;
import com.cheny.web.util.RequestUtil;
import com.cheny.web.util.ResultMsg;

@Controller
@RequestMapping(value = "/household")
public class HouseholdAction {

    @Autowired
    HouseholdService householdService;
    @Autowired
    CourseService courseService;
    @Autowired
    private UploadService uploadService;
    @Autowired
    private MessageService messageService;

    /**
     * 页面跳转函数
     */
    @RequestMapping(value = "/{pageName}", method = RequestMethod.GET)
    public ModelAndView viewAdminManagePages(HttpServletRequest request, @PathVariable("pageName") String pageName) throws Exception {
        HashMap<String, Object> hashMap = RequestUtil.getRequestParam(request);
        if(pageName.equals("allChild")) {
            List<Child> childList = householdService.getChildByHouseholdId(((Household)request.getSession().getAttribute("loginHousehold")).getId());
            hashMap.put("childList", childList);
        } else if (pageName.equals("editChild")) {
            Child child = householdService.getChildById(Integer.parseInt(hashMap.get("id").toString()));
            hashMap.put("child", child);
        } else if (pageName.equals("courseInfo") || pageName.equals("preBook")){
            Course course = courseService.getCourseById(Integer.parseInt(hashMap.get("id").toString()));
            hashMap.put("course", course);
            List<Child> childList = householdService.getChildByHouseholdId(((Household)request.getSession().getAttribute("loginHousehold")).getId());
            hashMap.put("childList", childList);
        } else if (pageName.equals("editPreBooked")) {
            CourseHouseholdChild courseHouseholdChild = courseService.getCourseHouseholdChildById(Integer.parseInt(hashMap.get("id").toString()));
            hashMap.put("courseHouseholdChild", courseHouseholdChild);
            List<Child> childList = householdService.getChildByHouseholdId(((Household)request.getSession().getAttribute("loginHousehold")).getId());
            hashMap.put("childList", childList);
        } else if(pageName.equals("preBookedCourseInfo")) {
            CourseHouseholdChild courseHouseholdChild = courseService.getCourseHouseholdChildById(Integer.parseInt(hashMap.get("id").toString()));
            hashMap.put("courseHouseholdChild", courseHouseholdChild);
            hashMap.put("course", courseHouseholdChild.getCourse());
        }
        return new ModelAndView("/household/" + pageName, hashMap);
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
     * 添加家长
     */
    @RequestMapping(value = "/addHousehold", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg addHousehold(HttpServletRequest request,
                               Household household,
                               @RequestParam(value = "uploadPictureFile", required = false) MultipartFile uploadPictureFile) {
        try {
            if (uploadPictureFile != null) {
                Integer id = 1;
                if (householdService.getMaxIdHousehold() != null) {
                    id = householdService.getMaxIdHousehold().getId() + 1;
                }
                household.setUploadPicture(uploadAttachement(id, "householdUploadPictureFile", uploadPictureFile, request));
            }
            householdService.addHousehold(household);
            return new ResultMsg(0, "添加成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "添加失败");
        }
    }
    /**
     * 
     */
    @RequestMapping(value = "/getHouseholdByUsername", method = RequestMethod.POST)
    @ResponseBody
    public Household getHouseholdByUsername(@RequestParam("username") String username) {
        try {
            return householdService.getHouseholdByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    @RequestMapping(value = "/getHouseholdById", method = RequestMethod.POST)
    @ResponseBody
    public Household getHouseholdById(@RequestParam("id") Integer id) {
        try {
            return householdService.getHouseholdById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    /**
     * 更改家长
     */
    @RequestMapping(value = "/updateHousehold", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg updateHousehold(HttpServletRequest request,
                                  Household household,
                                  @RequestParam(value = "uploadPictureFile", required = false) MultipartFile uploadPictureFile) {
        try {
            if (uploadPictureFile != null) {
                household.setUploadPicture(uploadAttachement(household.getId(), "householdUploadPictureFile", uploadPictureFile, request));
            }
            householdService.updateHousehold(household);
            request.getSession().setAttribute("loginHousehold", householdService.getHouseholdById(household.getId()));
            return new ResultMsg(0, "更改成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "更改失败");
        }
    }

    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg updatePassword(Household household, @RequestParam("pd") String pd) {
        ResultMsg resultMsg = null;
        try {
            if (pd.equals(householdService.getHouseholdById(household.getId()).getPassword())) {
                householdService.updatePassword(household);
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

    @RequestMapping(value="/getHouseholdByPage", method = RequestMethod.GET)
    @ResponseBody
    public ResultPage<Household> getHouseholdByPage(HttpServletRequest request) {
        Pager pager = new Pager();
        List<Household> householdList = null;
        ResultPage<Household> resultPage = null;
        HashMap<String, Object> paramMap = RequestUtil.getRequestParam(request);
        if (paramMap.get("page") != null) {
            pager.setCurrentPage(Integer.parseInt(paramMap.get("page").toString()));
        }
        paramMap.put("page", pager);
        try {
            householdList = householdService.getHouseholdByPage(paramMap);
            resultPage = new ResultPage<Household>(pager, householdList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultPage;
    }

    @RequestMapping(value="/deleteHousehold", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg deleteHousehold(@RequestParam("id") Integer id) {
        try {
            householdService.deleteHousehold(id);
            return new ResultMsg(0, "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "删除失败");
        }
    }

    @RequestMapping(value = "/addChild", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg addChild(HttpServletRequest request, Child child) {
        try {
            householdService.addChild(child);
            return new ResultMsg(0, "添加成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "添加失败");
        }
    }

    @RequestMapping(value = "/updateChild", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg updateChild(Child child) {
        try {
            householdService.updateChild(child);
            return new ResultMsg(0, "修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "修改失败");
        }
    }

    /**
     * 删除孩子（真删除）
     */
    @RequestMapping(value = "/deleteChild", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg deleteChild(@RequestParam("id") Integer id) {
        try {
            householdService.deleteChild(id);
            return new ResultMsg(0, "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "删除失败");
        }
    }
    /**
     * 预约课程
     * @param courseId
     * @param householdId
     * @param childId
     * @return
     */
    @RequestMapping(value = "/addCourseHouseholdChild", method = RequestMethod.POST) 
    @ResponseBody
    @Transactional
    public ResultMsg addCourseHouseholdChild(HttpServletRequest request,
                                             @RequestParam(value="courseId") Integer courseId,
                                             @RequestParam(value="householdId", required = false) Integer householdId,
                                             @RequestParam(value="childId", required = false) Integer childId) {
        CourseHouseholdChild courseHouseholdChild = new CourseHouseholdChild();
        courseHouseholdChild.setCourseId(courseId);
        if(householdId != null) {
            courseHouseholdChild.setHouseholdId(householdId);
        }
        if(childId != null) {
            courseHouseholdChild.setChildId(childId);
        }
        try {
            householdService.addCourseHouseholdChild(courseHouseholdChild);
            Course course = courseService.getCourseById(courseId);
            Household household = (Household)request.getSession().getAttribute("loginHousehold");
            Message message = new Message("你发布的课程有人预订了", "你发布的课程：" + course.getTitle() + " 有人预订", household.getId(), 2, course.getTeacherId(), 1, household.getUsername());
            messageService.addMessage(message);
            return new ResultMsg(0, "登记成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "登记失败");
        }
    }
    /**
     * 退订课程
     */
    @RequestMapping(value = "/deleteCourseHouseholdChild", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg deleteCourseHouseholdChild(@RequestParam("id") Integer id) {
        try {
            householdService.deleteCourseHouseholdChild(id);
            return new ResultMsg(0, "退订成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "退订失败");
        }
    }

    /**
     * 修改预约课程
     * @param courseId
     * @param householdId
     * @param childId
     * @return
     */
    @RequestMapping(value = "/updateCourseHouseholdChild", method = RequestMethod.POST) 
    @ResponseBody
    public ResultMsg updateCourseHouseholdChild(@RequestParam(value="id") Integer id,
                                             @RequestParam(value="courseId") Integer courseId,
                                             @RequestParam(value="householdId", required = false) Integer householdId,
                                             @RequestParam(value="childId", required = false) Integer childId) {
        CourseHouseholdChild courseHouseholdChild = new CourseHouseholdChild();
        courseHouseholdChild.setId(id);
        courseHouseholdChild.setCourseId(courseId);
        if(householdId != null) {
            courseHouseholdChild.setHouseholdId(householdId);
        }
        if(childId != null) {
            courseHouseholdChild.setChildId(childId);
        }
        try {
            householdService.updateCourseHouseholdChild(courseHouseholdChild);
            return new ResultMsg(0, "修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "修改失败");
        }
    }
}
