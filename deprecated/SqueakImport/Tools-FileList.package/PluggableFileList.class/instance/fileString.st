file string
fileString

	fileName ifNil: [^directory pathName].
	^directory fullNameFor: fileName