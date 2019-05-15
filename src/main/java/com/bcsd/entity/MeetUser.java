package com.bcsd.entity;

import java.io.Serializable;

/**
 * 用户实体类
 * @author HOEP
 * @data 2019/4/24
 */
public class MeetUser implements Serializable {
//    用户ID
    private String id;
//    所属分部ID
    private Integer subofficeid;
//    用户名
    private String username;
//    所属分部
    private String suboffice;
//    密码
    private String password;
//    性别
    private String sex;
//    邮箱
    private String email;
//    创建时间
    private String createdate;
//    备注
    private String tel;
//    排序
    private String order;
//    状态
    private String status;
//    是否禁用
    private String isdisabled;
//    操作人
    private String operuser;
//    操作时间
    private String operdate;
//    用户职位
    private String rolename;

    @Override
    public String toString() {
        return "MeetUser{" +
                "id='" + id + '\'' +
                ", subofficeid=" + subofficeid +
                ", username='" + username + '\'' +
                ", suboffice='" + suboffice + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", email='" + email + '\'' +
                ", createdate='" + createdate + '\'' +
                ", tel='" + tel + '\'' +
                ", order='" + order + '\'' +
                ", status='" + status + '\'' +
                ", isdisabled='" + isdisabled + '\'' +
                ", operuser='" + operuser + '\'' +
                ", operdate='" + operdate + '\'' +
                ", rolename='" + rolename + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getSubofficeid() {
        return subofficeid;
    }

    public void setSubofficeid(Integer subofficeid) {
        this.subofficeid = subofficeid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSuboffice() {
        return suboffice;
    }

    public void setSuboffice(String suboffice) {
        this.suboffice = suboffice;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIsdisabled() {
        return isdisabled;
    }

    public void setIsdisabled(String isdisabled) {
        this.isdisabled = isdisabled;
    }

    public String getOperuser() {
        return operuser;
    }

    public void setOperuser(String operuser) {
        this.operuser = operuser;
    }

    public String getOperdate() {
        return operdate;
    }

    public void setOperdate(String operdate) {
        this.operdate = operdate;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }
}
