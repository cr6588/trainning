package com.cheny.admin;

import java.util.List;
import java.util.Map;

import com.cheny.web.bean.Admin;
import com.cheny.web.bean.Announce;
import com.cheny.web.bean.DateNum;
public interface AdminMapper {

    public void addAdmin(Admin admin) throws Exception;

    public void updateAdmin(Admin admin) throws Exception;

    public void deleteAdmin(Integer id) throws Exception;

    public Admin getAdminById(Integer id) throws Exception;

    public List<Admin> getAdminByPage(Map<String, Object> param) throws Exception;

    public Admin getMaxIdAdmin() throws Exception;
    
    public Admin getAdminByUsername(String username) throws Exception;

    public void updatePassword(Admin admin) throws Exception;

    public List<DateNum> getNewAddNum(Map<String, Object> param) throws Exception;

    public DateNum getNumByDate(Map<String, Object> param) throws Exception;

    public Admin getRandAdmin() throws Exception;

    public void addAnnounce(Announce announce) throws Exception;

    public void updateAnnounce(Announce announce) throws Exception;

    public void deleteAnnounce(Integer id) throws Exception;

    public Announce getAnnounceById(Integer id) throws Exception;

    public List<Announce> getAnnounceByPage(Map<String, Object> param) throws Exception;
}
