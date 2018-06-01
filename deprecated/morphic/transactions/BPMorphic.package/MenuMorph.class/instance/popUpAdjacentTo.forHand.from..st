control
popUpAdjacentTo: rightOrLeftPoint forHand: hand from: sourceItem 
	"Present this menu at the given point under control of the given hand."
	| _gsSqueakTemp_tryToPlace _gsSqueakTemp_selectedOffset _gsSqueakTemp_rightPoint _gsSqueakTemp_leftPoint |
	hand world startSteppingSubmorphsOf: self.
	popUpOwner := sourceItem.
	self fullBounds.
	self updateColor.
	"ensure layout is current"
	_gsSqueakTemp_selectedOffset := (selectedItem
				ifNil: [self items first]) position - self position.
	_gsSqueakTemp_tryToPlace := [:where :mustFit | 
			| delta |
			self position: where - _gsSqueakTemp_selectedOffset.
			delta := self boundsInWorld amountToTranslateWithin: sourceItem worldBounds.
			(delta x = 0
					or: [mustFit])
				ifTrue: [delta = (0 @ 0)
						ifFalse: [self position: self position + delta].
					sourceItem world addMorphFront: self.
					^ self]].
	_gsSqueakTemp_rightPoint := rightOrLeftPoint first + (self layoutInset + self borderWidth @ 0).
	_gsSqueakTemp_leftPoint := rightOrLeftPoint last + (self layoutInset + self borderWidth - self width @ 0).
	_gsSqueakTemp_tryToPlace value: _gsSqueakTemp_rightPoint value: false;
		 value: _gsSqueakTemp_leftPoint value: false;
		 value: _gsSqueakTemp_rightPoint value: true