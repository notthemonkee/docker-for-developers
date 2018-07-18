component extends="taffy.core.resource" taffy_uri="/photo/{photoId}"
{
	public function get(string photoId = 1) {

		if(!arguments.keyExists("photoId") || !isNumeric(arguments.photoId)){
			arguments.photoId = 1;
		}

		var imagePath = expandPath(".\images");
		var images = directoryList(imagePath, false, "array", "*.jpg", "name");

		// keep the ID of the image we are to display within the bounds of the image array
		arguments.photoId = min(max(1, arguments.photoId), images.len());
		var fileName = getFileFromPath(images[arguments.photoId]);
		return representationOf([fileName]).withStatus(200); //member might be a structure, ORM entity, etc
	}
}