halos and balloon help
addOptionalHandlesTo: aHalo box: box 
	"eventually, add more handles for font..."
	self flag: #deferred.
	^ super addOptionalHandlesTo: aHalo box: box"Eventually...
	self addFontHandlesTo: aHalo box: box"