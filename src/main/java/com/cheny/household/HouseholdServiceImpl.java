package com.cheny.household;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cheny.household.HouseholdMapper;
import com.cheny.household.HouseholdService;
import com.cheny.web.bean.Child;
import com.cheny.web.bean.CourseHouseholdChild;
import com.cheny.web.bean.Household;
@Service
public class HouseholdServiceImpl implements HouseholdService {

    @Autowired
    HouseholdMapper householdMapper;
    @Override
    public void addHousehold(Household household) throws Exception {
        householdMapper.addHousehold(household);
    }

    @Override
    public void updateHousehold(Household household) throws Exception {
        householdMapper.updateHousehold(household);
    }

    @Override
    public void deleteHousehold(Integer id) throws Exception {
        householdMapper.deleteHousehold(id);
    }

    @Override
    public Household getHouseholdById(Integer id) throws Exception {
        return householdMapper.getHouseholdById(id);
    }

    @Override
    public List<Household> getHouseholdByPage(Map<String, Object> param) throws Exception {
        return householdMapper.getHouseholdByPage(param);
    }

    @Override
    public Household getMaxIdHousehold() throws Exception {
        return householdMapper.getMaxIdHousehold();
    }

    @Override
    public Household getHouseholdByUsername(String username) throws Exception {
        return householdMapper.getHouseholdByUsername(username);
    }

    @Override
    public void updatePassword(Household household) throws Exception {
        householdMapper.updatePassword(household);
    }

    @Override
    public void addChild(Child child) throws Exception {
        householdMapper.addChild(child);
    }

    @Override
    public void updateChild(Child child) throws Exception {
        householdMapper.updateChild(child);
    }

    @Override
    public void deleteChild(Integer id) throws Exception {
        householdMapper.deleteChild(id);
    }

    @Override
    public Child getChildById(Integer id) throws Exception {
        return householdMapper.getChildById(id);
    }

    @Override
    public List<Child> getChildByHouseholdId(Integer householdId) throws Exception {
        return householdMapper.getChildByHouseholdId(householdId);
    }

    @Override
    public void addCourseHouseholdChild(CourseHouseholdChild courseHouseholdChild) throws Exception {
        householdMapper.addCourseHouseholdChild(courseHouseholdChild);
        
    }

    @Override
    public void updateCourseHouseholdChild(CourseHouseholdChild courseHouseholdChild) throws Exception {
        householdMapper.updateCourseHouseholdChild(courseHouseholdChild);
    }

    @Override
    public void deleteCourseHouseholdChild(Integer id) throws Exception {
        householdMapper.deleteCourseHouseholdChild(id);
    }

}
