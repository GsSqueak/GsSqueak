private
asFrame: aRectangle 
	| _gsSqueakTemp_frame |
	aRectangle
		ifNil: [^ nil].
	_gsSqueakTemp_frame := LayoutFrame new.
	_gsSqueakTemp_frame leftFraction: aRectangle left;
		 rightFraction: aRectangle right;
		 topFraction: aRectangle top;
		 bottomFraction: aRectangle bottom.
	^ _gsSqueakTemp_frame