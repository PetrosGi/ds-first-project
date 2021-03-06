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


@WebServlet("/EditRoleServlet")
public class EditRoleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditRoleServlet() {
		super();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("roleId");
		ServletContext sc = request.getServletContext();
		Connection con = (Connection) sc.getAttribute("DBConnection");
		String roleName = request.getParameter("roleName");
		int addClient = (request.getParameter("addClient")) == null ? 0 : 1;
		int editClient = (request.getParameter("editClient")) == null ? 0 : 1;
		int checkInsurance = (request.getParameter("checkInsurance")) == null ? 0 : 1;
		int checkProblem = (request.getParameter("checkProblem")) == null ? 0 : 1;
		int checkVehicle = (request.getParameter("checkVehicle")) == null ? 0 : 1;
		int updateStats = (request.getParameter("updateStats")) == null ? 0 : 1;

		PreparedStatement ps = null;

		try {
			ps = con.prepareStatement(
					"update roles set `roleName`=?, `addClient`=?, `editClient`=?, `checkInsurance`=?, `checkInsurance`=?, `checkProblem`=?, `checkVehicle`=?, `updateStats`=?  where roleId=?");
			ps.setString(1, roleName);
			ps.setInt(2, addClient);
			ps.setInt(3, editClient);
			ps.setInt(4, checkInsurance);
			ps.setInt(5, checkProblem);
			ps.setInt(6, checkVehicle);
			ps.setInt(7, updateStats);
			ps.setString(8, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("admin/admin.jsp");
	}
}
