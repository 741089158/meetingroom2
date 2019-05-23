package com.bcsd.entity;

import lombok.Data;
import lombok.ToString;

/**
 * 日程
 */


@Data
@ToString
public class Events {

   // private Integer id;
    private String resourceId;
    private String start;
    private String end;
    private String title;

    public Events() {
    }

    public Events(String resourceId, String start, String end, String title) {
        this.resourceId = resourceId;
        this.start = start;
        this.end = end;
        this.title = title;
    }

    public String getResourceId() {
        return resourceId;
    }

    public void setResourceId(String resourceId) {
        this.resourceId = resourceId;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
