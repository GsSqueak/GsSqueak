private
preSelect: action
	"Pre-select and highlight the menu item associated with the given action."

	| i |
	i := selections indexOf: action ifAbsent: [^ self].
	marker ifNil: [self computeForm].
	marker := marker
		align: marker topLeft
		with: (marker left)@(frame inside top + (marker height * (i - 1))).
	selection := i.