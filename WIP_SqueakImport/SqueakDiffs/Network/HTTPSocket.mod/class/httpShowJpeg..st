get the page
httpShowJpeg: url
	"Display the picture retrieved from the given URL, which is assumed to be a JPEG file.
	See examples in httpGif:."

	self showImage: (self httpJpeg: url) named: (url findTokens: '/') last