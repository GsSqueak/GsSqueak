menu
fullScreenMaximumExtent
	"Zoom Window to Full World size with possible DeskMargins
	obey the maximum extent rules"
	| _gsSqueakTemp_left _gsSqueakTemp_right _gsSqueakTemp_possibleBounds |
	_gsSqueakTemp_left := _gsSqueakTemp_right := 0.
	self paneMorphs
		do: [:pane | ((pane isKindOf: ScrollPane)
					and: [pane retractableScrollBar])
				ifTrue: [pane scrollBarOnLeft
						ifTrue: [_gsSqueakTemp_left := _gsSqueakTemp_left max: pane scrollBarThickness]
						ifFalse: [_gsSqueakTemp_right := _gsSqueakTemp_right max: pane scrollBarThickness]]].
	_gsSqueakTemp_possibleBounds := self worldBounds
				insetBy: (_gsSqueakTemp_left @ 0 corner: _gsSqueakTemp_right @ 0).
	self maximumExtent
		ifNotNil: [_gsSqueakTemp_possibleBounds := _gsSqueakTemp_possibleBounds origin
						extent: (self maximumExtent min: _gsSqueakTemp_possibleBounds extent)].
	((Flaps sharedFlapsAllowed
				and: [Project current flapsSuppressed not])
			or: [Preferences fullScreenLeavesDeskMargins])
		ifTrue: [_gsSqueakTemp_possibleBounds := _gsSqueakTemp_possibleBounds insetBy: 22].
	self bounds: _gsSqueakTemp_possibleBounds