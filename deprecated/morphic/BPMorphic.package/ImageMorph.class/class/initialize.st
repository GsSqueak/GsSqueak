class initialization
initialize
	"ImageMorph initialize"
	| _gsSqueakTemp_h _gsSqueakTemp_p _gsSqueakTemp_d |
	DefaultForm := Form extent: 80 @ 40 depth: 16.
	_gsSqueakTemp_h := DefaultForm height // 2.
	0
		to: _gsSqueakTemp_h - 1
		do: [:i | 
			_gsSqueakTemp_p := i * 2 @ i.
			_gsSqueakTemp_d := i asFloat / _gsSqueakTemp_h asFloat.
			DefaultForm
				fill: (_gsSqueakTemp_p corner: DefaultForm extent - _gsSqueakTemp_p)
				fillColor: (Color
						r: _gsSqueakTemp_d
						g: 0.5
						b: 1.0 - _gsSqueakTemp_d)].
	self registerInFlapsRegistry