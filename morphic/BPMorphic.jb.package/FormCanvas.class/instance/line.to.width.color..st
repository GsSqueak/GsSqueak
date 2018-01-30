drawing
line: pt1 to: pt2 width: w color: c 
	| _gsSqueakTemp_offset |
	_gsSqueakTemp_offset := origin - (w // 2) asPoint.
	self setFillColor: c.
	port width: w;
		 height: w;
		 drawFrom: pt1 + _gsSqueakTemp_offset to: pt2 + _gsSqueakTemp_offset