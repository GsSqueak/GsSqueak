get the page
httpShowGif: url
	"Display the picture retrieved from the given URL, which is assumed to be a GIF file.
	See examples in httpGif:."

	self showImage: (self httpGif: url) named: (url findTokens: '/') last