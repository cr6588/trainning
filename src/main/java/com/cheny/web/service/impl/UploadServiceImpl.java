package com.cheny.web.service.impl;

import java.io.FileOutputStream;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cheny.web.service.UploadService;


@Service
public class UploadServiceImpl implements UploadService{

    @Override
    public void uploadFile(MultipartFile file, String path, String fileName) throws Exception {
        String IOFilePath = path+"\\"+ fileName;
        byte[] bytes = file.getBytes();
        FileOutputStream fos = new FileOutputStream(IOFilePath);
        fos.write(bytes);
        fos.close();
    }

}
