<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%
	ServletContext sc = request.getServletContext();
	Connection con = (Connection) sc.getAttribute("DBConnection");
	Statement st = null;
	ResultSet rs = null;
	st = con.createStatement();
	rs = st.executeQuery("select roleName,roleId from roles");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin - Add a User</title>
</head>
<body>
	<h1>Add a User</h1>
	<form action="../../AddUserServlet" method="POST">
		<table>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="fname"></td>
			</tr>
			<tr>
				<td>Surname</td>
				<td><input type="text" name="lname"></td>
			</tr>
			<tr>
				<td>Username</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>Choose Role</td>
				<td><select name="roleId">
						<%
							while (rs.next()) {
						%>
						<option value="<%=rs.getString("roleId")%>"><%=rs.getString("roleName")%></option>
						<%
							}
						%>
				</select></td>
			</tr>
		</table>
		<br> <input type="submit" value="Add">
	</form>
</body>
</html>