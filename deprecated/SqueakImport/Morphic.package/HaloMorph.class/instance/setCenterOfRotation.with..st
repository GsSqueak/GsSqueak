private
setCenterOfRotation: evt with: rotationHandle
	| localPt |
	evt hand obtainHalo: self.
	evt hand showTemporaryCursor: nil.
	(rotationHandle hasProperty: #trackCenterOfRotation) ifTrue:
		[localPt  :=  innerTarget transformFromWorld globalPointToLocal: rotationHandle center.
		innerTarget setRotationCenterFrom: localPt].
	
	rotationHandle removeProperty: #trackCenterOfRotation.
	self endInteraction: evt.