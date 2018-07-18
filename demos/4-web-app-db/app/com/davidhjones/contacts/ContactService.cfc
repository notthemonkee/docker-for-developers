/**
	A stateless service used for managing Contacts.
*/
component accessors="true" {

	property name ="contactDAO";

	/**
		Constructor
	*/
	public ContactService function init(required ContactDAO contactDAO) {
		setContactDAO(arguments.contactDAO);
		return this;
	}


	/**
		Returns an array of Contacts for all contact records in the system.
		Results are returned in default sort order.
	*/
	public array function getAll() {
		var result = [];
		var contactRS = getContactDAO().selectAll();

		for (var c in contactRS) {

			result.append(new Contact(
				ID = c.ID,
				firstName = c.firstName,
				lastName = c.lastName,
				age = c.age,
				favoriteBand = c.favoriteBand));

		}

		return result;
	}


	/**
		Returns a single contact instance for the given ID.
		If the contact does not exist, returns an new, empty contact.
	*/
	public Contact function getByID(required string ID) {
		var contactRS = getContactDAO().selectByID(ID = arguments.ID);
		return new Contact(
			ID = contactRS.ID,
			firstName = contactRS.firstName,
			lastName = contactRS.lastName,
			age = val(contactRS.age),
			favoriteBand = contactRS.favoriteBand);
	}


	/**
		Persists contact information to the DB.
		If the contact ID does not already exist, a new one is created,
		otherwise the existing contact info is updated.
	*/
	public string function save(
		required string ID,
		required string firstName,
		required string lastName,
		required numeric age,
		required string favoriteBand
		) {

		var contactID = getContactDAO().save(argumentCollection = arguments);
		return contactID;
	}

	/**
		Removes a single contact record by ID.
	*/
	public void function removeByID(required string ID){
		getContactDAO().deleteByID(ID = arguments.ID);
	}

}