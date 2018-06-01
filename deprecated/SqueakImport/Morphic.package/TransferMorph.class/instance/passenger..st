accessing
passenger: anObject

	passenger := anObject.

	self
		removeAllMorphs;
		addMorph: passenger asDraggableMorph;
		updateCopyIcon;
		setDefaultParameters.