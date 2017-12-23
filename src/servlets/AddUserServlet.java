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


@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddUserServlet() {
		super();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ServletContext sc = request.getServletContext();
		Connection con = (Connection) sc.getAttribute("DBConnection");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String username = request.getParameter("username");
		String roleId = request.getParameter("roleId");

		PreparedStatement ps = null;

		try {
			ps = con.prepareStatement(
					"insert into users (`fname`, `lname`, `username`, `roleId`) values (?,?,?,?)");
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, username);
			ps.setString(5, roleId);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("admin/admin.jsp");
	}
}
