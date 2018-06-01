-widgets
frameOffsets: aRectangle 
	| _gsSqueakTemp_frame |
	_gsSqueakTemp_frame := self layoutFrame
				ifNil: [LayoutFrame new].
	_gsSqueakTemp_frame topOffset: aRectangle top;
		 bottomOffset: aRectangle bottom;
		 leftOffset: aRectangle left;
		 rightOffset: aRectangle right.
	self layoutFrame: _gsSqueakTemp_frame.
	self layoutChanged