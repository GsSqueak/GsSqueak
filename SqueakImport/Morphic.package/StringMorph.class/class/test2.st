testing
test2
	"Return a morph with lots of strings for testing display speed."
	| c r |
	c := AlignmentMorph newColumn.
	SystemOrganization categories reverseDo:
		[:cat | c addMorph: (StringMorph new contents: cat)].
	r := RectangleMorph new extent: c fullBounds extent.
	c submorphsDo: [:m | r addMorph: m].
	^ r
