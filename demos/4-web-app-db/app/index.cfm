<cfscript>
	if(url.keyExists("deleteID")){
		application.contactService.removeByID(ID = url.deleteID);
		location("index.cfm", false);
	}
	contacts = application.contactService.getAll();
</cfscript>

<!doctype html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<title>SacInteractive Docker Demo - With Database</title>
	</head>

	<body>
		<cfoutput>
			<div class="container">
				<h1>Contacts</h1>
				<h3>New contact: <a href="edit.cfm" class="btn btn-default">Add</a></h3>
				<table class="table table-condensed">
					<tr>
						<th>ID</th>
						<th>Last Name</th>
						<th>First Name</th>
						<th>Age</th>
						<th>Favorite Band</th>
						<th>&nbsp;</th>
					</tr>
					<cfloop array="#contacts#" item="contact">
						<tr>
							<td>#encodeForHTML(contact.getID())#</td>
							<td>#encodeForHTML(contact.getLastName())#</td>
							<td>#encodeForHTML(contact.getFirstName())#</td>
							<td>#encodeForHTML(contact.getAge())#</td>
							<td>#encodeForHTML(contact.getFavoriteBand())#</td>
							<td class="text-right">
								<a href="edit.cfm?ID=#encodeForURL(contact.getID())#" class="btn btn-primary">Edit</a>
								<a href="index.cfm?deleteID=#encodeForURL(contact.getID())#" class="btn btn-danger">Delete</a>
							</td>
						</tr>
					</cfloop>
				</table>
			</div>
		</cfoutput>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	</body>
</html>