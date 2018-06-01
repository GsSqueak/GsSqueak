graphical tabs
graphicalTab
	self isCurrentlyGraphical
		ifTrue:
			[self changeTabGraphic]
		ifFalse:
			[self useGraphicalTab]