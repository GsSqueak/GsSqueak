new selection
nextTokenFrom: start direction: dir 
	"simple token-finder for compiler automated corrections"
	| _gsSqueakTemp_loc _gsSqueakTemp_str |
	_gsSqueakTemp_loc := start + dir.
	_gsSqueakTemp_str := paragraph string.
	[(_gsSqueakTemp_loc between: 1 and: _gsSqueakTemp_str size)
		and: [(_gsSqueakTemp_str at: _gsSqueakTemp_loc) isSeparator]]
		whileTrue: [_gsSqueakTemp_loc := _gsSqueakTemp_loc + dir].
	^ _gsSqueakTemp_loc