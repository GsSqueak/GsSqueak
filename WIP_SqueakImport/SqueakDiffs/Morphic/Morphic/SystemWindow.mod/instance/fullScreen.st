menu
fullScreen
	"Zoom Window to full owner size, allowing for scroll bars and desk margins"
	
	| left right possibleBounds |
	left := right := 0.
	self paneMorphs
		do: [:pane | ((pane isKindOf: ScrollPane)
					and: [pane retractableScrollBar])
				ifTrue: [pane scrollBarOnLeft
						ifTrue: [left := left max: pane scrollBarThickness]
						ifFalse: [right := right max: pane scrollBarThickness]]].
	possibleBounds := (RealEstateAgent maximumUsableAreaInWorld: self owner)
				insetBy: (left @ 0 corner: right @ 0).
	Preferences fullScreenLeavesDeskMargins
		ifTrue: [possibleBounds := possibleBounds insetBy: 22].
	self bounds: possibleBounds