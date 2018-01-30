error handling
deprecated: explanationString
	"Warn that the sending method has been deprecated."

	Deprecation
		maybeSignalDeprecationFor: thisContext sender
		message: ''
		explanation: explanationString