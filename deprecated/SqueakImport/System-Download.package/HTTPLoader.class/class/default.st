accessing
default
	DefaultLoader ifNil: [
		DefaultLoader := HTTPLoader new].
	^DefaultLoader