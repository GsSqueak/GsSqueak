controls
defaultEditContentsOptions
	"An array of associations of current display mode symbol to selector
	that creates the edit contents for that display mode. The default selector
	is #selectedMessage; this is a list of alternative to the default."

	^ {
		#byteCodes -> #selectedBytecodes
	}