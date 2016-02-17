package com.cheny.web.util;

public class ResultMsg {

    private Integer code;
    private String msg;

    public Integer getCode() {
        return code;
    }
    public void setCode(Integer code) {
        this.code = code;
    }
    public String getMsg() {
        return msg;
    }
    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ResultMsg(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

}
