stepping
localHaloBoundsFor: aMorph 
	"aMorph may be in the hand and perhaps not in our world"
	| _gsSqueakTemp_r |
	_gsSqueakTemp_r := aMorph worldBoundsForHalo truncated.
	aMorph world = self world
		ifFalse: [^ _gsSqueakTemp_r].
	^ (self transformFromOutermostWorld globalBoundsToLocal: _gsSqueakTemp_r) truncated