accessing
acceptContents: aString
	acceptAction ifNotNil:[acceptAction value: aString].
	^super acceptContents: aString.