package com.cheny.teacher;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cheny.teacher.TeacherMapper;
import com.cheny.teacher.TeacherService;
import com.cheny.web.bean.Teacher;
@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    TeacherMapper teacherMapper;
    @Override
    public void addTeacher(Teacher teacher) throws Exception {
        teacherMapper.addTeacher(teacher);
    }

    @Override
    public void updateTeacher(Teacher teacher) throws Exception {
        teacherMapper.updateTeacher(teacher);
    }

    @Override
    public void deleteTeacher(Integer id) throws Exception {
        teacherMapper.deleteTeacher(id);
    }

    @Override
    public Teacher getTeacherById(Integer id) throws Exception {
        return teacherMapper.getTeacherById(id);
    }

    @Override
    public List<Teacher> getTeacherByPage(Map<String, Object> param) throws Exception {
        return teacherMapper.getTeacherByPage(param);
    }

    @Override
    public Teacher getMaxIdTeacher() throws Exception {
        return teacherMapper.getMaxIdTeacher();
    }

    @Override
    public Teacher getTeacherByUsername(String username) throws Exception {
        return teacherMapper.getTeacherByUsername(username);
    }

    @Override
    public void updatePassword(Teacher teacher) throws Exception {
        teacherMapper.updatePassword(teacher);
    }

}
