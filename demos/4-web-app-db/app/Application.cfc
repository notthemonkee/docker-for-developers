component {
	this.name = "sacinteractive-web-app-db";

	public boolean function onApplicationStart() {
		application.contactDAO = new com.davidhjones.contacts.ContactDAO(datasource = "sacinteractive");
		application.contactService = new com.davidhjones.contacts.ContactService(contactDAO = application.contactDAO);
		return true;
	}

	public boolean function onRequestStart(required string targetPage) {
		if (url.keyExists("reset")) {
			onApplicationStart();
		}
		return true;
	}
}