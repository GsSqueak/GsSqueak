new selection
encompassLine: anInterval 
	"Return an interval that encompasses the entire line"
	| _gsSqueakTemp_string _gsSqueakTemp_left _gsSqueakTemp_right |
	_gsSqueakTemp_string := paragraph text string.
	_gsSqueakTemp_left := (_gsSqueakTemp_string lastIndexOfAnyOf: CharacterSet crlf startingAt: anInterval first - 1)
				+ 1.
	_gsSqueakTemp_right := (_gsSqueakTemp_string
				indexOfAnyOf: CharacterSet crlf
				startingAt: anInterval last + 1
				ifAbsent: [_gsSqueakTemp_string size + 1])
				- 1.
	^ _gsSqueakTemp_left to: _gsSqueakTemp_right