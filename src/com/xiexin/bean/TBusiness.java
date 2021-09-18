package com.xiexin.bean;

import java.io.Serializable;

/**
 * t_business
 * @author 
 */
public class TBusiness implements Serializable {
    private Integer bid;

    private String bnum;

    private String btype;

    private String bmark;

    private static final long serialVersionUID = 1L;

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getBnum() {
        return bnum;
    }

    public void setBnum(String bnum) {
        this.bnum = bnum;
    }

    public String getBtype() {
        return btype;
    }

    public void setBtype(String btype) {
        this.btype = btype;
    }

    public String getBmark() {
        return bmark;
    }

    public void setBmark(String bmark) {
        this.bmark = bmark;
    }
}