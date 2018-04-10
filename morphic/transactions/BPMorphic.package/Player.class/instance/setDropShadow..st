slot getters/setters
setDropShadow: aValue 
	"Setter for costume's dropShadow"
	| _gsSqueakTemp_aMorph |
	(_gsSqueakTemp_aMorph := costume renderedMorph) hasDropShadow ~~ aValue
		ifTrue: [_gsSqueakTemp_aMorph toggleDropShadow]