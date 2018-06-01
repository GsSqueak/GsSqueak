frame adornments
adornmentWithColor: aColor 
	"Create and return a frame adornment with the given color"
	| _gsSqueakTemp_size _gsSqueakTemp_box _gsSqueakTemp_form _gsSqueakTemp_fillStyle |
	^ self adornmentCache
		at: aColor
		ifAbsentPut: [_gsSqueakTemp_size := 16.
			_gsSqueakTemp_box := 0 @ 0 extent: _gsSqueakTemp_size asPoint.
			_gsSqueakTemp_form := Form extent: _gsSqueakTemp_size @ _gsSqueakTemp_size depth: 32.
			_gsSqueakTemp_fillStyle := MenuMorph gradientMenu
						ifTrue: [(GradientFillStyle ramp: {0.0
									-> (aColor alpha: 0.01). 0.8 -> aColor. 1.0 -> aColor}) origin: _gsSqueakTemp_box topRight - (_gsSqueakTemp_size @ 0);
								 direction: _gsSqueakTemp_size @ _gsSqueakTemp_size negated // 4;
								 radial: false]
						ifFalse: [SolidFillStyle color: aColor].
			_gsSqueakTemp_form getCanvas drawPolygon: {_gsSqueakTemp_box topRight. _gsSqueakTemp_box topRight + (0 @ _gsSqueakTemp_size). _gsSqueakTemp_box topRight - (_gsSqueakTemp_size @ 0)} fillStyle: _gsSqueakTemp_fillStyle.
			_gsSqueakTemp_form]