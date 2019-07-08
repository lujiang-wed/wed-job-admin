<%@page import="com.taobao.pamirs.schedule.ConsoleManager" %>
<%@page import="java.io.StringWriter" %>
<%@ page contentType="text/html; charset=GB2312" %>
<%
    try {
        if (!ConsoleManager.isInitial()) {
            response.sendRedirect("config.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<html>
<body style="font-size:12px;">
<%
    StringWriter writer = new StringWriter();
    try {
        ConsoleManager.getScheduleStrategyManager().printTree(
                ConsoleManager.getScheduleStrategyManager().getRootPath(), writer, "<br/>");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<pre>
<%=writer.getBuffer().toString()%>
</pre>
</body>
</html>
