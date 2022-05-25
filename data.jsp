<%@ page language="java" contentType="text/html"%>
<%@ page import="java.text.*,java.util.*" %>
<HTML>
<HEAD>
<TITLE>JSP Example</TITLE>
</HEAD>
<BODY BGCOLOR="1d898c">
<CENTER>
<H2>Date and Time</H2>
<%
java.util.Date today = new java.util.Date();
out.println("Today's date is: "+today);
%>
</CENTER>
</BODY>
</HTML>
