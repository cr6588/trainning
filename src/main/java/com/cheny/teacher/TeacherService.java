package com.cheny.teacher;

import java.util.List;
import java.util.Map;

import com.cheny.web.bean.Teacher;

public interface TeacherService {

    public void addTeacher(Teacher teacher) throws Exception;

    public void updateTeacher(Teacher teacher) throws Exception;

    public void deleteTeacher(Integer id) throws Exception;

    public Teacher getTeacherById(Integer id) throws Exception;

    public List<Teacher> getTeacherByPage(Map<String, Object> param) throws Exception;

    public Teacher getMaxIdTeacher() throws Exception;

    public Teacher getTeacherByUsername(String username) throws Exception;

    public void updatePassword(Teacher teacher) throws Exception;
}
