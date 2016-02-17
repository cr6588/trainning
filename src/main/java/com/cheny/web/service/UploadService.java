package com.cheny.web.service;


import org.springframework.web.multipart.MultipartFile;


public interface UploadService {

    /**
     * 上传文件
     * @param file 文件
     * @param path 文件在机器上的真实路径
     * @param fileName 文件名
     * @throws Exception
     */
    public void uploadFile(MultipartFile file, String path,String fileName) throws Exception;
}
