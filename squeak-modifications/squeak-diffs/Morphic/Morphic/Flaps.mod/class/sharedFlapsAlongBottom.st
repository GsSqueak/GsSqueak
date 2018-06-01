shared flaps
sharedFlapsAlongBottom
	"Put all shared flaps (except Painting which can't be moved) along the bottom"
	"Flaps sharedFlapsAlongBottom"

	| leftX unordered ordered |
	unordered := self globalFlapTabsIfAny asIdentitySet.
	ordered := Array streamContents:
		[:s | {
				'Squeak' translated.
				'Navigator' translated.
				'Supplies' translated.
				'Widgets' translated.
				'Stack Tools' translated.
				'Tools' translated.
				'Painting' translated.
			} do:
			[:id | (self globalFlapTabWithID: id) ifNotNil:
				[:ft | unordered remove: ft.
				id = 'Painting' translated ifFalse: [s nextPut: ft]]]].

	"Pace off in order from right to left, setting positions"
	leftX := Display width-15.
	ordered , unordered asArray reverseDo:
		[:ft | ft setEdge: #bottom.
		ft right: leftX - 3.  leftX := ft left].

	"Put Nav Bar centered under tab if possible"
	(self globalFlapTabWithID: 'Navigator' translated) ifNotNil:
		[:ft | ft referent left: (ft center x - (ft referent width//2) max: 0)].
	self positionNavigatorAndOtherFlapsAccordingToPreference.
