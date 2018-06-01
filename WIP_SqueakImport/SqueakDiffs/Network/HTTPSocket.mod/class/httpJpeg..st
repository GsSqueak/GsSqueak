get the page
httpJpeg: url
	"Fetch the given URL, parse it using the JPEG reader, and return the resulting Form."

	| doc ggg |
	doc := self httpGet: url.
	doc binary; reset.
	(ggg := JPEGReadWriter new) setStream: doc.
	^ ggg nextImage.
