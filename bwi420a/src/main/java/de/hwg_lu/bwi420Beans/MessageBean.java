package de.hwg_lu.bwi420Beans;
public class MessageBean {

	String infoMessage;
	String actionMessage;
	
	public MessageBean() {
//		this.infoMessage = "Willkommen an der Webanwendung BWI420";
//		this.actionMessage = "Bitte tun Sie irgendwas";
		this.setGeneralWelcome();
	}
	public MessageBean(String infoMessage, String actionMessage) {
		super();
		this.infoMessage = infoMessage;
		this.actionMessage = actionMessage;
	}
	public void setRegistrationWelcome(){
		this.infoMessage = "Willkommen zur BWI420-Registrierung";
		this.actionMessage = "Bitte geben Sie Ihre Daten ein";
	}
	public void setLoginSuccessful(String userid){
		this.infoMessage = "Willkommen " + userid + " am BWI420-Portal";
		this.actionMessage = "Bitte waehlen Sie eine Anwendung";
	}
	public void setLogoutSuccessful(){
		this.infoMessage = "Sie haben sich erfolgreich abgemeldet";
		this.actionMessage = "Bitte melden Sie sich wieder an";
	}
	public void setPortalWelcome(){
		this.infoMessage = "Willkommen am BWI420-Portal";
		this.actionMessage = "Bitte waehlen Sie eine Anwendung";
	}
	public void setLoginFailed(){
		this.infoMessage = "Ihr Anmeldeversuch ist fehlgeschlagen";
		this.actionMessage = "Bitte versuchen Sie es noch einmal";
	}
	public void setGeneralWelcome(){
		this.infoMessage = "Willkommen an der Webanwendung BWI420";
		this.actionMessage = "Bitte melden Sie sich an";
	}
	public String getMessageHtml(){
		String html = "";
		html += "<h2>" + this.getInfoMessage() + "</h2>";
		html += "<h4>" + this.getActionMessage() + "</h4>";
		return html;
	}
	public void setUseridTooLong(){
		this.setInfoMessage("Der Nickname ist zu lang");
		this.setActionMessage("Bitte waehlen Sie einen kuerzeren Nickname");
	}
	public void setPasswordTooLong(){
		this.setInfoMessage("Das Passwort ist zu lang");
		this.setActionMessage("Ihr Passwort darf maximal 32 Zeichen haben");
	}
	public void setPasswordEmpty(){
		this.setInfoMessage("Das Passwort ist leer");
		this.setActionMessage("Geben Sie ein Passwort ein");
	}
	public void setActiveInvalid(){
		this.setInfoMessage("Active muss Y oder N sein");
		this.setActionMessage("Bitte setzen Sie active auf Y oder N");
	}
	public void setAdminInvalid(){
		this.setInfoMessage("Admin muss Y oder N sein");
		this.setActionMessage("Bitte setzen Sie admin auf Y oder N");
	}
	public void setAccountCreated(String userid){
		this.setInfoMessage("Account " + userid + " wurde angelegt");
		this.setActionMessage("Gehen Sie jetzt zur Anmeldung");
	}
	public void setAccountAlreadyExists(String userid){
		this.setInfoMessage("Nickname " + userid + " existiert bereits");
		this.setActionMessage("Wählen Sie einen anderen Nickname");
	}
	public void setDBError(){
		this.setInfoMessage("Es ist ein Datenbankfehler aufgetreten");
		this.setActionMessage("Wenden Sie sich an IhreN AdministratorIn");
	}
	public String getInfoMessage() {
		return infoMessage;
	}
	public void setInfoMessage(String infoMessage) {
		this.infoMessage = infoMessage;
	}
	public String getActionMessage() {
		return actionMessage;
	}
	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}
}

	

