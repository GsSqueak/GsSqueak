running
startUpAfterLogin
	| scriptName loader isUrl |
	self setupFlaps.
	Preferences readDocumentAtStartup ifTrue: [
		HTTPClient isRunningInBrowser ifTrue:[
			self setupFromParameters.
			scriptName := self parameterAt: 'src'.
			CodeLoader defaultBaseURL: (self parameterAt: 'Base').
		] ifFalse:[
			scriptName := (Smalltalk documentPath) ifNil:[''].
			scriptName := scriptName convertFromSystemString.
			scriptName isEmpty ifFalse:[
				"figure out if script name is a URL by itself"
				isUrl := (scriptName asLowercase beginsWith:'http://') or:[
						(scriptName asLowercase beginsWith:'file://') or:[
						(scriptName asLowercase beginsWith:'ftp://')]].
				isUrl ifFalse:[ | encodedPath pathTokens |
					"Allow for ../dir/scriptName arguments"
					pathTokens := scriptName splitBy: FileDirectory slash.
					pathTokens := pathTokens collect: [:s | s encodeForHTTP].
					encodedPath := pathTokens reduce: [:acc :each | acc , FileDirectory slash , each].
					scriptName := (FileDirectory default uri 
						resolveRelativeURI: encodedPath) asString]].
		]. ]
	ifFalse: [ scriptName := '' ].

	scriptName isEmptyOrNil
		ifTrue:[^Preferences eToyFriendly ifTrue: [self currentWorld addGlobalFlaps]].
	loader := CodeLoader new.
	loader loadSourceFiles: (Array with: scriptName).
	(scriptName asLowercase endsWith: '.pr') 
		ifTrue:[self installProjectFrom: loader]
		ifFalse:[loader installSourceFiles].
