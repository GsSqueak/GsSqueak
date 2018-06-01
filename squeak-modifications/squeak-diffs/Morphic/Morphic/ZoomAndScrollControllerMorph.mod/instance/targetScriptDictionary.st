as yet unclassified
targetScriptDictionary

	target ifNil: [^Dictionary new].
	^target 
		valueOfProperty: #namedCameraScripts 
		ifAbsent: [
			| scriptDict |
			scriptDict := Dictionary new.
			target setProperty: #namedCameraScripts toValue: scriptDict.
			scriptDict
		].

