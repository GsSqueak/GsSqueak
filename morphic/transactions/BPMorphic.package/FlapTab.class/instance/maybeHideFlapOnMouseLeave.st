show & hide
maybeHideFlapOnMouseLeave
	self hasHalo
		ifTrue: [^ self].
	referent isInWorld
		ifFalse: [^ self].
	self hideFlapUnlessOverReferent