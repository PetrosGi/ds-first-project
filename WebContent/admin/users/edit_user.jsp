<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String userId = request.getParameter("userId");
	ServletContext sc = request.getServletContext();
	Connection con = (Connection) sc.getAttribute("DBConnection");
	Statement st = null;
	ResultSet rs = null;
	st = con.createStatement();
	rs = st.executeQuery("select * from users where id=" + userId);
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin - Edit a User</title>
</head>
<body>
	<h1>Edit a User</h1>
	<form action="../../EditUserServlet" method="POST">
		<table>
			<tr>
				<td>First name</td>
				<td><input type="text" name="fname"
					value="<%=rs.getString("fname")%>"></td>
			</tr>
			<tr>
				<td>Last name</td>
				<td><input type="text" name="lname"
					value="<%=rs.getString("lname")%>"></td>
			</tr>
			<tr>
				<td>Username</td>
				<td><input type="text" name="username"
					value="<%=rs.getString("username")%>"></td>
			</tr>


			<%
				Statement st2 = null;
				ResultSet rs2 = null;
				st2 = con.createStatement();
				rs2 = st2.executeQuery("select roleName,roleId from roles");
			%>

			<tr>
				<td>Role</td>
				<td><select name="roleId">
						<%
							while (rs2.next()) {
						%>
						<option
							<%if (rs.getString("role_id").equals(rs2.getString("roleId"))) {
					out.write("selected='selected'");
				}%>
							value="<%=rs2.getString("roleId")%>"><%=rs2.getString("roleName")%></option>
						<%
							}
						%>
				</select></td>
			</tr>

		</table>
		<br>
		<input type="hidden" name="userId" value="<%=userId%>"> <input
			type="submit" value="Edit">
	</form>
</body>
</html>