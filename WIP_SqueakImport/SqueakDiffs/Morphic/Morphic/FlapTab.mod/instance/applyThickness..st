menu
applyThickness: newThickness
	| toUse |
	toUse := newThickness asNumber max: 0.
	(self orientation == #vertical)
			ifTrue:
				[referent width: toUse]
			ifFalse:
				[referent height: toUse].
	self positionReferent. 
	self adjustPositionVisAVisFlap