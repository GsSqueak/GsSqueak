private store-retrieve
loadFromRefStream: stream 
	"Load translations from an external file"
	| loadedArray refStream |
	refStream := ReferenceStream on: stream.
	[loadedArray := refStream next]
		ensure: [refStream close].
	self processExternalObject: loadedArray 