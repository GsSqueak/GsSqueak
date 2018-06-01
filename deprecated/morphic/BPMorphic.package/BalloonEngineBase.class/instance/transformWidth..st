transforming
transformWidth: w 
	"Transform the given width"
	| _gsSqueakTemp_deltaX _gsSqueakTemp_deltaY _gsSqueakTemp_dstWidth _gsSqueakTemp_dstWidth2 |
	w = 0
		ifTrue: [^ 0].
	self point1Get at: 0 put: 0.
	self point1Get at: 1 put: 0.
	self point2Get at: 0 put: w * 256.
	self point2Get at: 1 put: 0.
	self point3Get at: 0 put: 0.
	self point3Get at: 1 put: w * 256.
	self transformPoints: 3.
	_gsSqueakTemp_deltaX := ((self point2Get at: 0)
				- (self point1Get at: 0)) asFloat.
	_gsSqueakTemp_deltaY := ((self point2Get at: 1)
				- (self point1Get at: 1)) asFloat.
	_gsSqueakTemp_dstWidth := (_gsSqueakTemp_deltaX * _gsSqueakTemp_deltaX + (_gsSqueakTemp_deltaY * _gsSqueakTemp_deltaY)) sqrt asInteger + 128 // 256.
	_gsSqueakTemp_deltaX := ((self point3Get at: 0)
				- (self point1Get at: 0)) asFloat.
	_gsSqueakTemp_deltaY := ((self point3Get at: 1)
				- (self point1Get at: 1)) asFloat.
	_gsSqueakTemp_dstWidth2 := (_gsSqueakTemp_deltaX * _gsSqueakTemp_deltaX + (_gsSqueakTemp_deltaY * _gsSqueakTemp_deltaY)) sqrt asInteger + 128 // 256.
	_gsSqueakTemp_dstWidth2 < _gsSqueakTemp_dstWidth
		ifTrue: [_gsSqueakTemp_dstWidth := _gsSqueakTemp_dstWidth2].
	_gsSqueakTemp_dstWidth = 0
		ifTrue: [^ 1]
		ifFalse: [^ _gsSqueakTemp_dstWidth]