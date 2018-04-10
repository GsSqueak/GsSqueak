testing
test2
	"Return a morph with lots of strings for testing display speed."
	| _gsSqueakTemp_c _gsSqueakTemp_r |
	_gsSqueakTemp_c := AlignmentMorph newColumn.
	SystemOrganization categories
		reverseDo: [:cat | _gsSqueakTemp_c
				addMorph: (StringMorph new contents: cat)].
	_gsSqueakTemp_r := RectangleMorph new extent: _gsSqueakTemp_c fullBounds extent.
	_gsSqueakTemp_c
		submorphsDo: [:m | _gsSqueakTemp_r addMorph: m].
	^ _gsSqueakTemp_r