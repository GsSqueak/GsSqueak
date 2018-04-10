private
positionAt: aPoint relativeTo: aMenuItem inWorld: aWorld 
	"Note: items may not be laid out yet (I found them all to be at 0@0), 
	so we have to add up heights of items above the selected item."
	| _gsSqueakTemp_i _gsSqueakTemp_yOffset _gsSqueakTemp_sub _gsSqueakTemp_delta |
	self fullBounds.
	"force layout"
	_gsSqueakTemp_i := 0.
	_gsSqueakTemp_yOffset := 0.
	[(_gsSqueakTemp_sub := self submorphs at: (_gsSqueakTemp_i := _gsSqueakTemp_i + 1)) == aMenuItem]
		whileFalse: [_gsSqueakTemp_yOffset := _gsSqueakTemp_yOffset + _gsSqueakTemp_sub height].
	self position: aPoint - (2 @ (_gsSqueakTemp_yOffset + 8)).
	"If it doesn't fit, show it to the left, not to the right of the hand."
	self right > aWorld worldBounds right
		ifTrue: [self right: aPoint x + 1].
	"Make sure that the menu fits in the world."
	_gsSqueakTemp_delta := self bounds
				amountToTranslateWithin: (aWorld worldBounds
						withHeight: (aWorld worldBounds height - 18 max: ActiveHand position y + 1)).
	_gsSqueakTemp_delta = (0 @ 0)
		ifFalse: [self position: self position + _gsSqueakTemp_delta]