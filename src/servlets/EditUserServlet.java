package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditUserServlet() {
		super();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userId = request.getParameter("userId");
		String roleId = request.getParameter("roleId");
		ServletContext sc = request.getServletContext();
		Connection con = (Connection) sc.getAttribute("DBConnection");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String username = request.getParameter("username");

		PreparedStatement ps = null;

		try {
			ps = con.prepareStatement("update users set `fname`=?, `lname`=?, `username`=?,`role_id`=? where `id`=?");
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, username);
			ps.setString(4, roleId);
			ps.setString(5, userId);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("admin/admin.jsp");
	}
}
