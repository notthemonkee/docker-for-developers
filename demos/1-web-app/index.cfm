<cfscript>
	variables.imagePath = expandPath(".\images");
	variables.images = directoryList(variables.imagePath, false, "array", "*.jpg", "name");
</cfscript>

<!doctype html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<title>SacInteractive Docker Demo - Basic Web App</title>
		<style>
			.thumbnail img {
				height: 250px;
				width: 100%;
			}
		</style>
	</head>
	<body>
		<cfoutput>
			<div class="container">
				<h1>My Photo Gallery <small>Some of my favorite travel photos</small></h1>
				<hr>
				<div class="row">
					<cfloop array="#variables.images#" item="image" index="i">
						<cfset fileName = getFileFromPath(image)>
						<cfset imageURL = "image.cfm?imageID=#i#">
						<div class="col-xs-6 col-md-3">
							<a href="#imageURL#" class="thumbnail"><img src="images/#encodeForURL(fileName)#"></a>
							<div class="caption">
								<p><a href="#imageURL#" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-picture"></span> View</a></p>
							</div>
						</div>
					</cfloop>
				</div>
			</div>
		</cfoutput>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	</body>
</html>