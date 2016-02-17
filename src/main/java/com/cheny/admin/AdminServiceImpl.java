package com.cheny.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cheny.admin.AdminMapper;
import com.cheny.admin.AdminService;
import com.cheny.web.bean.Admin;
import com.cheny.web.bean.Announce;
import com.cheny.web.bean.DateNum;
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper adminMapper;
    @Override
    public void addAdmin(Admin admin) throws Exception {
        adminMapper.addAdmin(admin);
    }

    @Override
    public void updateAdmin(Admin admin) throws Exception {
        adminMapper.updateAdmin(admin);
    }

    @Override
    public void deleteAdmin(Integer id) throws Exception {
        adminMapper.deleteAdmin(id);
    }

    @Override
    public Admin getAdminById(Integer id) throws Exception {
        return adminMapper.getAdminById(id);
    }

    @Override
    public List<Admin> getAdminByPage(Map<String, Object> param) throws Exception {
        return adminMapper.getAdminByPage(param);
    }

    @Override
    public Admin getMaxIdAdmin() throws Exception {
        return adminMapper.getMaxIdAdmin();
    }

    @Override
    public Admin getAdminByUsername(String username) throws Exception {
        return adminMapper.getAdminByUsername(username);
    }

    @Override
    public void updatePassword(Admin admin) throws Exception {
        adminMapper.updatePassword(admin);
    }

    @Override
    public String getAdministratorPassword(String filePath) throws Exception {
        Properties prop = new Properties();
        prop.load(new FileInputStream(new File(filePath)));
        String password = prop.getProperty("A04");
        return password;
    }

    @Override
    public void setAdministratorPassword(String filePath, String password) throws Exception {
        Properties prop = new Properties();
        prop.load(new FileInputStream(new File(filePath)));
        FileOutputStream fos = new FileOutputStream(new File(filePath));
        prop.setProperty("A04", password);
        prop.store(fos, "A04");
        fos.close();
    }

    @Override
    public List<DateNum> getNewAddNum(Map<String, Object> param) throws Exception {
        return adminMapper.getNewAddNum(param);
    }

    @Override
    public DateNum getNumByDate(Map<String, Object> param) throws Exception {
        return adminMapper.getNumByDate(param);
    }

    @Override
    public Admin getRandAdmin() throws Exception {
        return adminMapper.getRandAdmin();
    }

    @Override
    public void addAnnounce(Announce announce) throws Exception {
        adminMapper.addAnnounce(announce); 
        
    }

    @Override
    public void updateAnnounce(Announce announce) throws Exception {
        adminMapper.updateAnnounce(announce);
    }

    @Override
    public void deleteAnnounce(Integer id) throws Exception {
        adminMapper.deleteAnnounce(id);
    }

    @Override
    public Announce getAnnounceById(Integer id) throws Exception {
        return adminMapper.getAnnounceById(id);
    }

    @Override
    public List<Announce> getAnnounceByPage(Map<String, Object> param) throws Exception {
        return adminMapper.getAnnounceByPage(param);
    }

}
