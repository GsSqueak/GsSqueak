menu messages
changeAlignment
	| aList reply  |
	aList := #(leftFlush centered justified rightFlush).
	reply := UIManager default chooseFrom: aList values: aList.
	reply ifNil:[^self].
	self setAlignment: reply.
	paragraph composeAll.
	self recomputeSelection.
	^ true