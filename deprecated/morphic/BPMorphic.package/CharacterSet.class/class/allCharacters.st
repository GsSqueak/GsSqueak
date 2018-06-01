instance creation
allCharacters
	"return a set containing all characters"
	| _gsSqueakTemp_set |
	_gsSqueakTemp_set := self empty.
	0
		to: 255
		do: [:ascii | _gsSqueakTemp_set
				add: (Character value: ascii)].
	^ _gsSqueakTemp_set