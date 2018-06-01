show & hide
openFully
	"Make an educated guess at how wide or tall we are to be, and open to
	that thickness"
	| _gsSqueakTemp_thickness _gsSqueakTemp_amt |
	_gsSqueakTemp_thickness := referent boundingBoxOfSubmorphs extent max: 100 @ 100.
	self applyThickness: (_gsSqueakTemp_amt := self orientation == #horizontal
					ifTrue: [_gsSqueakTemp_thickness y]
					ifFalse: [_gsSqueakTemp_thickness x]).
	self lastReferentThickness: _gsSqueakTemp_amt.
	self showFlap