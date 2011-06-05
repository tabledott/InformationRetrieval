<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<title>The servlet example </title>
	</head>
	<body>
		<h1>A simple web application</h1>
		<form method="POST" action="firms.jsp">
			<label for="name">Enter your query </label>
			<input type="text" id="name" name="name"/><br><br>
			<input type="submit" value="Submit Form"/>
			<input type="reset" value="Reset Form"/>
		</form>
		<table>
			
		</table>
	</body>
</html>