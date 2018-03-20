actions & preps
erasePrep: evt 
	"Transparent paint, square brush. Be careful not to let this be undone
	by asking palette for brush and color."
	| _gsSqueakTemp_size _gsSqueakTemp_pfPen _gsSqueakTemp_myBrush |
	_gsSqueakTemp_pfPen := self get: #paintingFormPen for: evt.
	_gsSqueakTemp_size := (self getNibFor: evt) width.
	self
		set: #brush
		for: evt
		to: (_gsSqueakTemp_myBrush := Form extent: _gsSqueakTemp_size @ _gsSqueakTemp_size depth: 1).
	_gsSqueakTemp_myBrush offset: 0 @ 0 - (_gsSqueakTemp_myBrush extent // 2).
	_gsSqueakTemp_myBrush fillWithColor: Color black.
	_gsSqueakTemp_pfPen sourceForm: _gsSqueakTemp_myBrush.
	"transparent"
	_gsSqueakTemp_pfPen combinationRule: Form erase1bitShape.
	_gsSqueakTemp_pfPen color: Color black