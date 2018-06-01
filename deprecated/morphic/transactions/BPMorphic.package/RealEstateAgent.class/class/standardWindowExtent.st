settings
standardWindowExtent
	"Answer the standard default extent for new windows. "
	| _gsSqueakTemp_effectiveExtent _gsSqueakTemp_width _gsSqueakTemp_strips _gsSqueakTemp_height _gsSqueakTemp_grid _gsSqueakTemp_allowedArea _gsSqueakTemp_maxLevel _gsSqueakTemp_extent |
	_gsSqueakTemp_effectiveExtent := self maximumUsableArea extent - (self scrollBarSetback @ self screenTopSetback).
	Preferences reverseWindowStagger
		ifTrue: ["NOTE: following copied from strictlyStaggeredInitialFrameFor:"
			_gsSqueakTemp_allowedArea := self maximumUsableArea
						insetBy: (self scrollBarSetback @ self screenTopSetback extent: 0 @ 0).
			"Number to be staggered at each corner (less on small
			screens) "
			_gsSqueakTemp_maxLevel := _gsSqueakTemp_allowedArea area > 300000
						ifTrue: [3]
						ifFalse: [2].
			"Amount by which to stagger (less on small screens)"
			_gsSqueakTemp_grid := _gsSqueakTemp_allowedArea area > 500000
						ifTrue: [40]
						ifFalse: [20].
			_gsSqueakTemp_extent := _gsSqueakTemp_allowedArea extent - (_gsSqueakTemp_grid * (_gsSqueakTemp_maxLevel + 1 * 2) + (_gsSqueakTemp_grid // 2)) min: StandardSize.
			"600@400"
			_gsSqueakTemp_extent y < 300
				ifTrue: [^ _gsSqueakTemp_extent x @ 300].
			^ _gsSqueakTemp_extent].
	_gsSqueakTemp_width := (_gsSqueakTemp_strips := self windowColumnsDesired) > 1
				ifTrue: [_gsSqueakTemp_effectiveExtent x // _gsSqueakTemp_strips]
				ifFalse: [3 * _gsSqueakTemp_effectiveExtent x // 4].
	_gsSqueakTemp_height := (_gsSqueakTemp_strips := self windowRowsDesired) > 1
				ifTrue: [_gsSqueakTemp_effectiveExtent y // _gsSqueakTemp_strips]
				ifFalse: [3 * _gsSqueakTemp_effectiveExtent y // 4].
	^ _gsSqueakTemp_width @ _gsSqueakTemp_height"RealEstateAgent standardWindowExtent"