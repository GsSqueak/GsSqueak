*SqCollectionLiterals-*SqCollectionLiterals-adding
add: aCharacter
	"I automatically become a WideByteCharacterSet if you add a wide character to myself"
	
	| index |
	(index := aCharacter asInteger + 1) <= 256 ifFalse: [
		| wide |
		wide := WideCharacterSet new.
		wide addAll: self.
		wide add: aCharacter.
		self becomeForward: wide.
		^aCharacter ].
	(byteArrayMap at: index) = 1 ifFalse: [
		byteArrayMap at: index put: 1.
		tally := tally + 1 ].
	^aCharacter
