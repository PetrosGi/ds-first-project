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
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin - Delete a Role</title>
</head>
<body>
	<h1>Delete a Role</h1>
	<form action="../../DeleteRoleServlet" method="POST">
		<table>
			<tr>
				<td>Role</td>
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
		<br> <input type="submit" value="Delete">
	</form>
</body>
</html>