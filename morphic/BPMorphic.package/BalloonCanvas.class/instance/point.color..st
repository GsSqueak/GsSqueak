drawing
point: pt color: c 
	"Is there any use for this?"
	| _gsSqueakTemp_myPt |
	transform
		ifNil: [_gsSqueakTemp_myPt := pt]
		ifNotNil: [_gsSqueakTemp_myPt := transform localPointToGlobal: pt].
	^ super point: _gsSqueakTemp_myPt color: c