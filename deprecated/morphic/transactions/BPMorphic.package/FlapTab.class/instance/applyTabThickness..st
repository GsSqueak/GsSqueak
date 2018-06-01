solid tabs
applyTabThickness: newThickness 
	self orientation == #vertical
		ifTrue: [submorphs first width: newThickness asNumber]
		ifFalse: [submorphs first height: newThickness asNumber].
	self fitContents.
	self positionReferent.
	self adjustPositionVisAVisFlap