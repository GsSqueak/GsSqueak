file in/out
currentVersionNumber

	version ifNil: [^0].
	version isInteger ifTrue:[^version].
	version := Base64MimeConverter decodeInteger: version unescapePercents.
	^version