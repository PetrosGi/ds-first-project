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
	rs = st.executeQuery("select id,fname,lname from users");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin - Select a User to edit</title>
</head>
<body>
	<h1>Select a User to edit</h1>
	<form action="edit_user.jsp" method="POST">
		<table>
			<tr>
				<td>User</td>
				<td><select name="userId">
						<%
							while (rs.next()) {
						%>
						<option value="<%=rs.getString("id")%>"><%=rs.getString("fname")%>
							<%=rs.getString("lname")%></option>
						<%
							}
						%>
				</select></td>
			</tr>
		</table>
		<br> <input type="submit" value="Select">
	</form>
</body>
</html>