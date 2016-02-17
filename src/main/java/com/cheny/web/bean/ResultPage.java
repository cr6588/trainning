package com.cheny.web.bean;

import java.io.Serializable;
import java.util.List;

import com.cheny.web.util.Pager;

public class ResultPage<T> implements Serializable{

    private static final long serialVersionUID = 1433195195928257170L;
    /**
     * 分页信息
     */
    private Pager pager;
    /**
     * 总条数
     */
    private Integer total;
    /**
     * 分页查询出的数据
     */
    private List<T> rows;

    public ResultPage(){
        
    }
    public ResultPage(Integer total,List<T> rows){
        this.total = total;
        this.rows = rows;
    }
    public ResultPage(List<T> rows){
        this.rows = rows;
    }
    public ResultPage(Pager pager,List<T> rows){
        this.pager = pager;
        this.rows = rows;
    }
    public Integer getTotal() {
        return total;
    }
    public void setTotal(Integer total) {
        this.total = total;
    }
    public List<T> getRows() {
        return rows;
    }
    public void setRows(List<T> rows) {
        this.rows = rows;
    }
    public Pager getPager() {
        return pager;
    }
    public void setPager(Pager pager) {
        this.pager = pager;
    }
}
