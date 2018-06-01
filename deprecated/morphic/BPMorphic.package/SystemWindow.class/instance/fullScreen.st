menu
fullScreen
	"Zoom Window to full owner size, allowing for scroll bars and desk
	margins "
	| _gsSqueakTemp_left _gsSqueakTemp_right _gsSqueakTemp_possibleBounds |
	_gsSqueakTemp_left := _gsSqueakTemp_right := 0.
	self paneMorphs
		do: [:pane | ((pane isKindOf: ScrollPane)
					and: [pane retractableScrollBar])
				ifTrue: [pane scrollBarOnLeft
						ifTrue: [_gsSqueakTemp_left := _gsSqueakTemp_left max: pane scrollBarThickness]
						ifFalse: [_gsSqueakTemp_right := _gsSqueakTemp_right max: pane scrollBarThickness]]].
	_gsSqueakTemp_possibleBounds := (RealEstateAgent maximumUsableAreaInWorld: self owner)
				insetBy: (_gsSqueakTemp_left @ 0 corner: _gsSqueakTemp_right @ 0).
	Preferences fullScreenLeavesDeskMargins
		ifTrue: [_gsSqueakTemp_possibleBounds := _gsSqueakTemp_possibleBounds insetBy: 22].
	self bounds: _gsSqueakTemp_possibleBounds