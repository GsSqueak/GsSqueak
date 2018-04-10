private
endOfParagraph: position 
	| _gsSqueakTemp_s |
	_gsSqueakTemp_s := self string.
	^ _gsSqueakTemp_s
		indexOf: Character cr
		startingAt: position
		ifAbsent: [_gsSqueakTemp_s size + 1]