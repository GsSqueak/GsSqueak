layout
minWidth

	| result |
	textStyle ifNil: [^ 9].
	borderWidth ifNil: [^ 9].

	result := 9 + (borderWidth*2).
	margins ifNil: [^ result].
	
	^ margins isRectangle
		ifTrue: [result + margins left + margins right]
		ifFalse: [margins isPoint
			ifTrue: [result + margins x + margins x]
			ifFalse: [result + (2*margins)]]