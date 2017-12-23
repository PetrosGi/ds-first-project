package beans;

import java.io.Serializable;

public class Role implements Serializable {

	

	private static final long serialVersionUID = 6817273734890238551L;
	private String roleName = null;
	private int roleId = 0;
	private boolean priv_addClient = false;
	private boolean priv_editClient = false;
	private boolean priv_checkInsurance = false;
	private boolean priv_checkProblem = false;
	private boolean priv_checkVehicle = false;
	private boolean priv_updateStats = false;
	
	public Role() {
		super();
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public boolean hasPriv_addClient() {
		return priv_addClient;
	}

	public void setPriv_addClient(boolean priv_addClient) {
		this.priv_addClient = priv_addClient;
	}

	public boolean hasPriv_editClient() {
		return priv_editClient;
	}

	public void setPriv_editClient(boolean priv_editClient) {
		this.priv_editClient = priv_editClient;
	}

	public boolean hasPriv_deleteClient() {
		return priv_checkInsurance;
	}

	public void setPriv_deleteClient(boolean priv_deleteClient) {
		this.priv_checkInsurance = priv_deleteClient;
	}

	public boolean hasPriv_addVehicle() {
		return priv_checkProblem;
	}

	public void setPriv_addVehicle(boolean priv_addVehicle) {
		this.priv_checkProblem = priv_addVehicle;
	}

	public boolean hasPriv_editVehicle() {
		return priv_checkVehicle;
	}

	public void setPriv_editVehicle(boolean priv_editVehicle) {
		this.priv_checkVehicle = priv_editVehicle;
	}

	public boolean hasPriv_deleteVehicle() {
		return priv_updateStats;
	}

	public void setPriv_deleteVehicle(boolean priv_deleteVehicle) {
		this.priv_updateStats = priv_deleteVehicle;
	}

}
