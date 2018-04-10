menu
sendToBack
	| _gsSqueakTemp_aWorld _gsSqueakTemp_nextWindow |
	_gsSqueakTemp_aWorld := self world.
	_gsSqueakTemp_nextWindow := _gsSqueakTemp_aWorld submorphs
				detect: [:m | m isSystemWindow
						and: [m ~~ self]]
				ifNone: [^ self].
	_gsSqueakTemp_nextWindow beKeyWindow.
	_gsSqueakTemp_aWorld addMorphNearBack: self