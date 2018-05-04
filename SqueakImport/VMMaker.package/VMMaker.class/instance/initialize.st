initialize
initialize
	logger := Transcript.
	inline := true.
	forBrowser := false.
	internalPlugins := SortedCollection new.
	externalPlugins := SortedCollection new.
	platformName := self class machinesDirName.
	allFilesList := Dictionary new.
	interpreterClassName := ContextInterpreter name