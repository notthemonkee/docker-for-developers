component extends="taffy.core.resource" taffy_uri="/photos"
{
	public function get() {

		var imagePath = expandPath(".\images");

		var images = directoryList(imagePath, false, "array", "*.jpg", "name");
		var imageNames = arrayMap( images, function(item){
			return getFileFromPath(item);
		});

		return representationOf(imageNames).withStatus(200);
	}
}