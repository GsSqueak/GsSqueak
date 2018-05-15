updating
checkForPluginUpdate
	| pluginVersion updateURL |
	HTTPClient isRunningInBrowser
		ifFalse: [^false].
	pluginVersion := Smalltalk namedArguments
		at: (Smalltalk platformName copyWithout: Character space) asUppercase
		ifAbsent: [^false].
	updateURL := Smalltalk namedArguments
		at: 'UPDATE_URL'
		ifAbsent: [^false].
	^SystemVersion check: pluginVersion andRequestPluginUpdate: updateURL