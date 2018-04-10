private
setFrame: aRectangle in: widget 
	| _gsSqueakTemp_frame |
	aRectangle
		ifNil: [^ nil].
	_gsSqueakTemp_frame := aRectangle isRectangle
				ifTrue: [self asFrame: aRectangle]
				ifFalse: [aRectangle].
	"assume LayoutFrame"
	widget layoutFrame: _gsSqueakTemp_frame.
	widget hResizing: #spaceFill;
		 vResizing: #spaceFill