multilingual
keyboardInterpreter
	^ keyboardInterpreter
		ifNil: [keyboardInterpreter := LanguageEnvironment currentPlatform class defaultInputInterpreter]