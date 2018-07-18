<cfscript>
	cfparam(name = "url.imageID", default = "1");
	variables.imagePath = expandPath(".\images");
	variables.images = directoryList(variables.imagePath, false, "array", "*.jpg", "name");

	// keep the ID of the image we are to display within the bounds of the image array
	url.imageID = min(max(1, url.imageID), variables.images.len());
	variables.fileName = getFileFromPath(variables.images[url.imageID]);
</cfscript>

<!doctype html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<title>Photo <cfoutput>#encodeForHTML(variables.fileName)#</cfoutput></title>
	</head>
	<body>
		<cfoutput>
			<div class="container">
			<h1>Photo: <small>#encodeForHTML(variables.fileName)# <a href="index.cfm" class="btn btn-primary"><span class="glyphicon glyphicon-backward"></span> Back</a></small></h1>
			<hr>
				<div class="row">
					<div class="col-xs-12">
						<a href="##" class="thumbnail"><img src="images/#encodeForURL(variables.fileName)#"></a>
					</div>
				</div>
			</div>
		</cfoutput>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	</body>
</html>