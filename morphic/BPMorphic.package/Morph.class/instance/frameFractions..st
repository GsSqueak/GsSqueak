-widgets
frameFractions: aRectangle 
	| _gsSqueakTemp_frame |
	_gsSqueakTemp_frame := self layoutFrame
				ifNil: [LayoutFrame new].
	_gsSqueakTemp_frame topFraction: aRectangle top;
		 bottomFraction: aRectangle bottom;
		 leftFraction: aRectangle left;
		 rightFraction: aRectangle right.
	self layoutFrame: _gsSqueakTemp_frame.
	self layoutChanged