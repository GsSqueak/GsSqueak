private
setCenterOfRotation: evt with: rotationHandle 
	| _gsSqueakTemp_localPt |
	evt hand obtainHalo: self.
	evt hand showTemporaryCursor: nil.
	(rotationHandle hasProperty: #dragByCenterOfRotation)
		ifFalse: [_gsSqueakTemp_localPt := innerTarget transformFromWorld globalPointToLocal: rotationHandle center.
			innerTarget setRotationCenterFrom: _gsSqueakTemp_localPt].
	rotationHandle removeProperty: #dragByCenterOfRotation.
	self endInteraction