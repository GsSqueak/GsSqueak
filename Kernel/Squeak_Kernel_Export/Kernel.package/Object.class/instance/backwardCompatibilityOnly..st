error handling
backwardCompatibilityOnly: explanationString
	"Warn that the sending method has been deprecated. Methods that are tagt with #backwardCompatibility:
	 are kept for compatibility."

	Deprecation
		maybeSignalDeprecationFor: thisContext sender
		message: ' (but will be kept for compatibility)'
		explanation: explanationString