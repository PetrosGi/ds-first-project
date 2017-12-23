<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String id = request.getParameter("roleId");
	ServletContext sc = request.getServletContext();
	Connection con = (Connection) sc.getAttribute("DBConnection");
	Statement st = null;
	ResultSet rs = null;
	st = con.createStatement();
	rs = st.executeQuery("select * from roles where roleId=" + id);
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin - Edit a Role</title>
</head>
<body>
	<h1>Edit a Role</h1>
	<form action="../../EditRoleServlet" method="POST">
		<table>
			<tr>
				<td>Role name</td>
				<td><input type="text" name="roleName"
					value="<%=rs.getString("roleName")%>"></td>
			</tr>
			<tr>
				<td>Add client</td>
				<td><input type="checkbox" name="priv_addClient"
					<%if (rs.getBoolean("priv_addClient")) {
				out.write("checked");
			}%>></td>
			</tr>
			<tr>
				<td>Edit client</td>
				<td><input type="checkbox" name="priv_editClient"
					<%if (rs.getBoolean("priv_editClient")) {
				out.write("checked");
			}%>></td>
			</tr>
			<tr>
				<td>Check insurance</td>
				<td><input type="checkbox" name="priv_checkInsurance"
					<%if (rs.getBoolean("priv_deleteClient")) {
				out.write("checked");
			}%>></td>
			</tr>
			<tr>
				<td>Check for problem results</td>
				<td><input type="checkbox" name="priv_checkProblem"
					<%if (rs.getBoolean("priv_addVehicle")) {
				out.write("checked");
			}%>></td>
			</tr>
			<tr>
				<td>Check vehicle</td>
				<td><input type="checkbox" name="priv_checkVehicle"
					<%if (rs.getBoolean("priv_editVehicle")) {
				out.write("checked");
			}%>></td>
			</tr>
			<tr>
				<td>Update stats</td>
				<td><input type="checkbox" name="priv_updateStats"
					<%if (rs.getBoolean("priv_deleteVehicle")) {
				out.write("checked");
			}%>></td>
			</tr>			
		</table>
		<input type="hidden" name="roleId" value="<%=id%>"> <br>
		<input type="submit" value="Edit">
	</form>
</body>
</html>