/**
	This entity component represents a single contact.
*/
component accessors="true" {

	property name ="id";
	property name ="firstName";
	property name ="lastName";
	property name ="age";
	property name ="favoriteBand";

	/**
		Constructor. Populate and return a Contact instance.
	*/
	public Contact function init(
		required string ID,
		required string firstName,
		required string lastName,
		required numeric age,
		required string favoriteBand
	) {

		setId(arguments.ID);
		setFirstName(arguments.firstName);
		setLastName(arguments.lastName);
		setAge(arguments.age);
		setFavoriteBand(arguments.favoriteBand);

		return this;
	}
}