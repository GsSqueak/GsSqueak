public
translationFor: aString 
	| |
	aString size = 0 ifTrue: [^ '']. "Gettext header"
	^ (self searchByDictionary: aString) ifNil: [aString]
