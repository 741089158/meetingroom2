package com.bcsd.entity;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

@Data
@ToString
public class Trees implements Serializable {

    private Integer id;
    private String name;
    private String value;
    private Boolean checked;
    private List<Trees> list;

    public Trees(Integer id, String name, String value, Boolean checked, List<Trees> list) {
        this.id = id;
        this.name = name;
        this.value = value;
        this.checked = checked;
        this.list = list;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }

    public List<Trees> getList() {
        return list;
    }

    public void setList(List<Trees> list) {
        this.list = list;
    }
}
