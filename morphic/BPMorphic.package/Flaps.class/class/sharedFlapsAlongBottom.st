shared flaps
sharedFlapsAlongBottom
	"Put all shared flaps (except Painting which can't be moved) along the
	bottom "
	"Flaps sharedFlapsAlongBottom"
	| _gsSqueakTemp_leftX _gsSqueakTemp_unordered _gsSqueakTemp_ordered |
	_gsSqueakTemp_unordered := self globalFlapTabsIfAny asIdentitySet.
	_gsSqueakTemp_ordered := Array
				streamContents: [:s | {'Squeak' translated. 'Navigator' translated. 'Supplies' translated. 'Widgets' translated. 'Stack Tools' translated. 'Tools' translated. 'Painting' translated}
						do: [:id | (self globalFlapTabWithID: id)
								ifNotNil: [:ft | 
									_gsSqueakTemp_unordered remove: ft.
									id = 'Painting' translated
										ifFalse: [s nextPut: ft]]]].
	"Pace off in order from right to left, setting positions"
	_gsSqueakTemp_leftX := Display width - 15.
	_gsSqueakTemp_ordered , _gsSqueakTemp_unordered asArray
		reverseDo: [:ft | 
			ft setEdge: #bottom.
			ft right: _gsSqueakTemp_leftX - 3.
			_gsSqueakTemp_leftX := ft left].
	"Put Nav Bar centered under tab if possible"
	(self globalFlapTabWithID: 'Navigator' translated)
		ifNotNil: [:ft | ft referent
				left: (ft center x - (ft referent width // 2) max: 0)].
	self positionNavigatorAndOtherFlapsAccordingToPreference