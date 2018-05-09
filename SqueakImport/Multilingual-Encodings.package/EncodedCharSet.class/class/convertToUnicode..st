class methods
convertToUnicode: aCode
	"Translate aCode in our encoding, into equivalent unicode encoding"
	| table v |
	(table := self ucsTable) ifNil: [^ 16rFFFD].
	(v := table at: 1 + aCode) = -1 ifTrue: [^ 16rFFFD].
	^ v