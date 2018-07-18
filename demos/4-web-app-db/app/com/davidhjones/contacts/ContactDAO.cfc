/**
	Handles database interaction for the Contacts table.
*/
component accessors="true"{

	property name ="datasource";


	/**
		Constructor
	*/
	public ContactDAO function init(required string datasource) {
		setDatasource(arguments.datasource);
		return this;
	}


	/**
		Returns a recordset of Contacts for all contact records in the system.
		Results are returned in default sort order.
	*/
	public query function selectAll() {
		var sql = "SELECT
					Id,
					FirstName,
					LastName,
					Age,
					FavoriteBand
				FROM
					Contacts
				ORDER BY
					LastName,
					FirstName,
					Id";

		var opts = {datasource : getDatasource()};

		return queryExecute(sql, {}, opts);
	}

	/**
		Returns a single contact record for the given ID.
		If the contact does not exist, returns an empty record.
	*/
	public query function selectByID(required string ID) {

		var sql = "SELECT
						 Id,
						FirstName,
						LastName,
						Age,
						FavoriteBand
					FROM
						Contacts
					WHERE
						ID = (:id)";

		var params = {
			id : {value : arguments.ID, cfsqltype : "cf_sql_varchar"}
		};

		var opts = {datasource : getDatasource()};

		return queryExecute(sql, params, opts);
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


		var contactRS = selectByID(id = arguments.ID);
		if (contactRS.recordcount == 0) {
			// insert contact
			var contactID = createUUID();
			var sql = "
				INSERT INTO Contacts(
					Id,
					FirstName,
					LastName,
					Age,
					FavoriteBand
				)
				VALUES(
					(:id),
					(:firstName),
					(:lastName),
					(:age),
					(:favoriteBand)
				)";

			var params = {
				id = {value = contactID, cfsqltype = "cf_sql_varchar"},
				firstName = {value = arguments.firstName, cfsqltype = "cf_sql_varchar"},
				lastName = {value = arguments.lastName, cfsqltype = "cf_sql_varchar"},
				age = {value = arguments.age, cfsqltype = ""},
				favoriteBand = {value = arguments.favoriteBand, cfsqltype = "cf_sql_varchar"}
			};

			var opts = {datasource : getDatasource()};

			queryExecute(sql, params, opts);

			return contactID;
		}
		else {
			// update contact
			var contactID = arguments.ID;
			var sql = "
				UPDATE
					Contacts
				SET
					FirstName = (:firstName),
					LastName = (:lastName),
					Age = (:age),
					FavoriteBand = (:favoriteBand)
				WHERE
					Id = (:id)";


			var params = {
				id = {value = contactID, cfsqltype = "cf_sql_varchar"},
				firstName = {value = arguments.firstName, cfsqltype = "cf_sql_varchar"},
				lastName = {value = arguments.lastName, cfsqltype = "cf_sql_varchar"},
				age = {value = arguments.age, cfsqltype = ""},
				favoriteBand = {value = arguments.favoriteBand, cfsqltype = "cf_sql_varchar"}
			};

			var opts = {datasource : getDatasource()};

			queryExecute(sql, params, opts);

			return contactID;
		}
	}

	/**
		Deletes a contact record by ID.
	*/
	public void function deleteByID(required string ID){
		var sql = "
			DELETE
				FROM Contacts
			WHERE
				Id = (:id)";


		var params = {
			id : {value : arguments.ID, cfsqltype : "cf_sql_varchar"}
		};

		var opts = {datasource : getDatasource()};

		queryExecute(sql, params, opts);
	}
}