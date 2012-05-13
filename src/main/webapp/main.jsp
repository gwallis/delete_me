<%@page import="org.omg.CORBA.Request"%>
<%@page import="ie.cit.cloudapp.GuestBook"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="repo" class="ie.cit.cloudapp.GuestBookRepository" scope="session"></jsp:useBean>
<html>
<head>
<link rel="stylesheet" href="styles/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Guestbook Application - GWallis - BSC 2011-12</title>
</head>
<body>
	<h1>Guestbook Application</h1>
	<h2>Guestbook Entries submitted</h2>
	
	<c:if test="${param._method.equals(\"delete\")}">
		<%
		String strgbEntryID = request.getParameter("gbEntryID");
		Integer gbEntryID = Integer.valueOf(strgbEntryID);
		repo.getGbEntries().remove(gbEntryID-1);
		%>
	</c:if>
	<c:if test="${param._method.equals(\"put\") }">
		<%
		String strgbEntryID = request.getParameter("gbEntryID");
		Integer gbEntryID = Integer.valueOf(strgbEntryID);
		GuestBook gbEntry = repo.getGbEntries().get(gbEntryID-1);
		gbEntry.setDone(!gbEntry.isDone());
		%>
	</c:if>	
	<c:if test="${! empty param.text }">
		<%
		GuestBook gbEntry = new GuestBook();
		gbEntry.setText(request.getParameter("text"));
		repo.addEntry(gbEntry);
	%>
	</c:if>
		<c:forEach items="${repo.gbEntries}" var="entry" varStatus="row">
			${entry.text} ${entry.done}<br />
			<form method="post">
			<input name="_method" type="hidden" value="delete">
			<input name="gbEntryID" type="hidden" value="${row.count}">
			<input type="submit" value="Delete">
			</form>
			<form method="post">
			<input name="_method" type="hidden" value="put">
			<input name="gbEntryID" type="hidden" value="${row.count}">
			<input type="submit" value="Update">
			</form>			
		</c:forEach>
	<h2>Add entry to Guestbook</h2>
	<form method="post">
		Text: <input name="text"><input type="submit" value="Submit your comment">
	</form>
</body>
</html>