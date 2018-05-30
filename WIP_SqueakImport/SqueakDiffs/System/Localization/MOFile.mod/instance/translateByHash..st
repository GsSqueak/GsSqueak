experimental
translateByHash: aString
	| trans |
	trans := self searchByHash: aString.
	trans isNil ifTrue: [^aString]
			ifFalse: [^trans].
