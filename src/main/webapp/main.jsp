<%@page import="ie.cit.cloudapp.GuestBook"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="repo" class="ie.cit.cloudapp.GuestBookRepository" scope="application"></jsp:useBean>
<html>
<head>
<link rel="stylesheet" href="styles/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Guestbook Application - GWallis - BSC 2011-12</title>
</head>
<body>
	<h1>Guestbook Application</h1>
	<h2>Guestbook Entries submitted</h2>
	<c:if test="${! empty param.text }">
		<%
		GuestBook gbEntry = new GuestBook();
		gbEntry.setText(request.getParameter("text"));
		repo.addEntry(gbEntry);
	%>
	</c:if>
		<c:forEach items="${repo.gbEntries}" var="entry">
			${entry.text}<br />
		</c:forEach>
	<h2>Add entry to Guestbook</h2>
	<form>
		Text: <input name="text"><input type="submit">
	</form>
</body>
</html>