volume list and pattern
pattern: textOrStringOrNil

	textOrStringOrNil
		ifNil: [pattern := '*']
		ifNotNil: [pattern := textOrStringOrNil asString].
	pattern isEmpty ifTrue: [pattern := '*'].
	self updateFileList.
	^ true
