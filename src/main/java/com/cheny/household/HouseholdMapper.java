package com.cheny.household;

import java.util.List;
import java.util.Map;

import com.cheny.web.bean.Child;
import com.cheny.web.bean.CourseHouseholdChild;
import com.cheny.web.bean.Household;

public interface HouseholdMapper {

    public void addHousehold(Household household) throws Exception;

    public void updateHousehold(Household household) throws Exception;

    public void deleteHousehold(Integer id) throws Exception;

    public Household getHouseholdById(Integer id) throws Exception;

    public List<Household> getHouseholdByPage(Map<String, Object> param) throws Exception;

    public Household getMaxIdHousehold() throws Exception;

    public Household getHouseholdByUsername(String username) throws Exception;

    public void updatePassword(Household household) throws Exception;

    public void addChild(Child child) throws Exception;

    public void updateChild(Child child) throws Exception;

    public void deleteChild(Integer id) throws Exception;

    public Child getChildById(Integer id) throws Exception;

    public List<Child> getChildByHouseholdId(Integer householdId) throws Exception;

    public void addCourseHouseholdChild(CourseHouseholdChild courseHouseholdChild) throws Exception;

    public void updateCourseHouseholdChild(CourseHouseholdChild courseHouseholdChild) throws Exception;

    public void deleteCourseHouseholdChild(Integer id) throws Exception;

}
