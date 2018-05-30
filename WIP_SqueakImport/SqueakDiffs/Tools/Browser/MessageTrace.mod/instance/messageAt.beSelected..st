actions
messageAt: indexInteger beSelected: aBoolean
	^ indexInteger isZero ifFalse:
		[ messageSelections
			at: indexInteger
			put: aBoolean ]