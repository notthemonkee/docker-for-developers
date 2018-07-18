<cfscript>

	if (cgi.request_method eq "post") {

		application.contactService.save(
			ID = form.id,
			firstName = form.firstName,
			lastName = form.lastName,
			age = form.age,
			favoriteBand = form.favoriteBand);

		location("index.cfm", false);

	}
	else {
		// If not passed an ID, then we are in "add" mode
		cfparam(name = "url.id", type = "string", default = "");
		// No matter what, we'll get back a Contact, either one from the
		// DB if we find the supplied contact ID or an new, empty Contact.
		contact = application.contactService.getById(id = url.id);
	}
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
				<h1><cfif contact.getID().len()>Edit<cfelse>Add</cfif> Contact</h1>
				<div class="row">
					<div class="col-sm-8">
						<form class="form-horizontal" method="post">
							<input type="hidden" name="id" value="#encodeForHTMLAttribute(contact.getID())#">
						  <div class="form-group">
							 <label for="firstName" class="col-sm-3 control-label">First Name</label>
							 <div class="col-sm-5">
								<input type="text" required class="form-control" name="firstName" id="firstName" value="#encodeForHtmlAttribute(contact.getFirstName())#">
							 </div>
						  </div>
						  <div class="form-group">
							 <label for="lastName" class="col-sm-3 control-label">Last Name</label>
							 <div class="col-sm-5">
								<input type="text" required class="form-control" name="lastName" id="lastName" value="#encodeForHtmlAttribute(contact.getLastName())#">
							 </div>
						  </div>
						  <div class="form-group">
							 <label for="age" class="col-sm-3 control-label">Age</label>
							 <div class="col-sm-5">
								<input type="number" required class="form-control" name="age" id="age" value="#encodeForHtmlAttribute(contact.getAge())#">
							 </div>
						  </div>
						  <div class="form-group">
							 <label for="favoriteBand" class="col-sm-3 control-label">Favorite Band</label>
							 <div class="col-sm-5">
								<input type="text" required class="form-control" name="favoriteBand" id="favoriteBand" value="#encodeForHtmlAttribute(contact.getFavoriteBand())#">
							 </div>
						  </div>

						  <div class="form-group">
							 <div class="col-sm-offset-3 col-sm-5">
								<button type="submit" class="btn btn-primary">Save</button>
								<button type="reset" class="btn btn-default">Reset</button>
							 </div>
						  </div>
						</form>
					</div>
				</div>
			</div>
		</cfoutput>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	</body>
</html>