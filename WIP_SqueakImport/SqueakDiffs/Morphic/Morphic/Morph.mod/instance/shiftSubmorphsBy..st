*Morphic-MorphicExtras-geometry
shiftSubmorphsBy: delta
	self shiftSubmorphsOtherThan: (submorphs select: [:m | m wantsToBeTopmost]) by: delta