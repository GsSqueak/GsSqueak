geometry
justDroppedInto: aMorph event: anEvent 
	isCollapsed
		ifTrue: [self
				position: ((self position max: 0 @ 0)
						grid: 8 @ 8).
			collapsedFrame := self bounds]
		ifFalse: [fullFrame := self bounds].
	self beKeyWindow.
	self hasDropShadow: Preferences menuAppearance3d.
	"See #startDragFromLabel:."
	aMorph == self world
		ifTrue: [self assureLabelAreaVisible].
	(Project uiManager openToolsAttachedToMouseCursor
			and: (self hasProperty: #initialDrop))
		ifTrue: [self removeProperty: #initialDrop.
			(self submorphs
				detect: [:m | m isKindOf: BottomRightGripMorph]
				ifNone: [])
				ifNotNil: [:grip | 
					grip referencePoint: anEvent position;
						 setProperty: #targetHadDropShadow toValue: true.
					"See MorphicToolBuilder >> #open:"
					self hasDropShadow: false.
					anEvent hand newMouseFocus: grip]].
	^ super justDroppedInto: aMorph event: anEvent