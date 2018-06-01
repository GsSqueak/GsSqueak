initialize-release
initialize
	super initialize.
	directoryCache := WeakIdentityKeyDictionary new.
	listIndex := 0.
	patternList := self defaultPatternList