testing
test
	"Return a morph with lots of strings for testing display speed."
	| _gsSqueakTemp_c |
	_gsSqueakTemp_c := AlignmentMorph newColumn.
	SystemOrganization categories
		do: [:cat | _gsSqueakTemp_c
				addMorph: (StringMorph new contents: cat)].
	^ _gsSqueakTemp_c