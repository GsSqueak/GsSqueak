class initialization
initialize
	ValueIndex := 2.
	self assert: (Association instVarNameForIndex:ValueIndex) = 'value'.
	PrimitiveFailToken class ~~ Object ifTrue:
		[PrimitiveFailToken := Object new]