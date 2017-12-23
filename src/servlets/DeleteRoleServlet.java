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

@WebServlet("/DeleteRoleServlet")
public class DeleteRoleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteRoleServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("roleId");
		ServletContext sc = request.getServletContext();
		Connection con = (Connection) sc.getAttribute("DBConnection");

		PreparedStatement ps = null;

		try {
			ps = con.prepareStatement("delete from roles where roleId=?");
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("admin/admin.jsp");
	}
}
