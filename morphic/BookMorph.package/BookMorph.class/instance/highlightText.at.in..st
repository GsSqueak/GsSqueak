menu
highlightText: stringToHilite at: index in: insideOf 
	"Find the container with this text and highlight it. May not be able to
	do it for stringMorphs."
	"Find the container with that text"
	| _gsSqueakTemp_container |
	self
		allMorphsDo: [:sub | insideOf == sub userString
				ifTrue: [_gsSqueakTemp_container := sub]].
	_gsSqueakTemp_container
		ifNil: [self
				allMorphsDo: [:sub | insideOf = sub userString
						ifTrue: [_gsSqueakTemp_container := sub]]].
	"any match"
	_gsSqueakTemp_container
		ifNil: [^ nil].
	"Order it highlighted"
	_gsSqueakTemp_container isTextMorph
		ifTrue: [_gsSqueakTemp_container editor selectFrom: index to: stringToHilite size - 1 + index].
	_gsSqueakTemp_container changed.
	^ _gsSqueakTemp_container