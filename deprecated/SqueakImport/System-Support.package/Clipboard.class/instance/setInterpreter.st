accessing
setInterpreter

	interpreter := LanguageEnvironment defaultClipboardInterpreter.
	interpreter ifNil: [
		"Should never be reached, but just in case."
		interpreter := NoConversionClipboardInterpreter new].
