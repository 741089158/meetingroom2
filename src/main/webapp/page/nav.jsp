<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="layui-col-md2 block-border-top">
    <ul class="layui-nav layui-nav-tree" style="width: 100%">
        <li class="layui-nav-item"><a href="javascript:;">我的会议</a>
            <dl class="layui-nav-child">
                <dd>
                    <a href="${pageContext.request.contextPath}/meetroom/remeetroom"
                       data-set="/meetingroom/page/schedule/schedule.jsp,/meetingroom/meetroom/remmet">会议室预订</a>
                </dd>
                <dd>
                    <a href="${pageContext.request.contextPath}/page/meeting/meettable.jsp">我的预订</a>
                </dd>
                <dd>
                    <a href="${pageContext.request.contextPath}/page/meeting/meet_history.jsp">我的历史会议</a>
                </dd>
            </dl>
        </li>

        <li class="layui-nav-item"><a href="javascript:;">会议室管理</a>
            <dl class="layui-nav-child">
                <security:authorize access="hasAnyRole('ROLE_ROOM')">
                <dd>
                    <a href="${pageContext.request.contextPath}/page/meet_management/meet_management.jsp">会议室维护</a>
                </dd>
                </security:authorize>
               <%-- <dd>
                    <a href="${pageContext.request.contextPath}/page/meet_management/common_room.jsp">常用会议室</a>
                </dd>--%>
            </dl>
        </li>

        <%--<li class="layui-nav-item"><a href="javascript:;">会议统计</a>
            <dl class="layui-nav-child">
                <dd>
                    <a href="${pageContext.request.contextPath}/page/report/meet_report.jsp">会议报表</a>
                </dd>
                <dd>
                    <a href="${pageContext.request.contextPath}/page/report/history_report.jsp">历史报表</a>
                </dd>
            </dl>
        </li>--%>
        <li class="layui-nav-item"><a href="javascript:;">系统管理</a>
            <dl class="layui-nav-child">
                <dd>
                    <a href="${pageContext.request.contextPath}/page/other/mail_home.jsp">邮件管理</a>
                </dd>
                <security:authorize access="hasAnyRole('ROLE_USER')">
                <dd>
                    <a href="${pageContext.request.contextPath}/page/user/linkman.jsp">联系人</a>
                </dd>
                </security:authorize>
               <%-- <dd>
                    <a href="${pageContext.request.contextPath}/page/config/config_home.jsp">配置管理</a>
                </dd>--%>
            </dl>
        </li>
        <%--<security:authorize access="hasRole('ADMIN')">--%>
        <li class="layui-nav-item"><a href="javascript:;">管理后台</a>
            <dl class="layui-nav-child">
                <security:authorize access="hasAnyRole('ROLE_DICT')">
                <dd>
                    <a href="${pageContext.request.contextPath}/page/dict/dict_home.jsp">字典管理</a>
                </dd>
                </security:authorize>
                <security:authorize access="hasAnyRole('ROLE_DEPT')">
                <dd>
                    <a href="${pageContext.request.contextPath}/page/dept/meet_dept.jsp">部门管理</a>
                </dd>
                </security:authorize>
                <security:authorize access="hasAnyRole('ROLE_USER')">
                <dd>
                    <a href="${pageContext.request.contextPath}/page/user/meet_user.jsp">用户管理</a>
                </dd>
                </security:authorize>
                <security:authorize access="hasAnyRole('ROLE_ROLE')">
                    <dd>
                        <a href="${pageContext.request.contextPath}/page/role/role_home.jsp">角色管理</a>
                    </dd>
                </security:authorize>
                <security:authorize access="hasAnyRole('ROLE_MENU')">
                <dd>
                    <a href="${pageContext.request.contextPath}/page/menu/menu_home.jsp">菜单管理</a>
                </dd>
                </security:authorize>

            </dl>
        </li>
        <%--</security:authorize>--%>
    </ul>
</div>