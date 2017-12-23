<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin - Add new Role</title>
</head>
<body>
	<h1>Add a new Role</h1>
	<form action="../../AddRoleServlet" method="POST">
		<table>
			<tr>
				<td>Role name</td>
				<td><input type="text" name="roleName"></td>
			</tr>
			<tr>
				<td>Add client</td>
				<td><input type="checkbox" name="priv_addClient"></td>
			</tr>
			<tr>
				<td>Edit client</td>
				<td><input type="checkbox" name="priv_editClient"></td>
			</tr>
			<tr>
				<td>Check insurance</td>
				<td><input type="checkbox" name="priv_checkInsurance"></td>
			</tr>
			<tr>
				<td>Check for problem results</td>
				<td><input type="checkbox" name="priv_checkProblem"></td>
			</tr>
			<tr>
				<td>Check vehicle</td>
				<td><input type="checkbox" name="priv_checkVehicle"></td>
			</tr>
			<tr>
				<td>Update stats</td>
				<td><input type="checkbox" name="priv_updateStats"></td>
			</tr>
		</table>
		<br> <input type="submit" value="Add">
	</form>
</body>
</html>