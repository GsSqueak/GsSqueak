glyphs
getGlyphFlagsFrom: fontFile size: nPts 
	"Read in the flags for this glyph. The outer loop gathers the flags that
	are actually contained in the table. If the repeat bit is set in a flag
	then the next byte is read from the table; this is the number of times
	to repeat the last flag. The inner loop does this, incrementing the
	outer loops index each time."
	| _gsSqueakTemp_flags _gsSqueakTemp_index _gsSqueakTemp_repCount _gsSqueakTemp_flagBits |
	_gsSqueakTemp_flags := ByteArray new: nPts.
	_gsSqueakTemp_index := 1.
	[_gsSqueakTemp_index <= nPts]
		whileTrue: [_gsSqueakTemp_flagBits := fontFile next.
			_gsSqueakTemp_flags at: _gsSqueakTemp_index put: _gsSqueakTemp_flagBits.
			(_gsSqueakTemp_flagBits bitAnd: 8)
					= 8
				ifTrue: [_gsSqueakTemp_repCount := fontFile next.
					_gsSqueakTemp_repCount
						timesRepeat: [_gsSqueakTemp_index := _gsSqueakTemp_index + 1.
							_gsSqueakTemp_flags at: _gsSqueakTemp_index put: _gsSqueakTemp_flagBits]].
			_gsSqueakTemp_index := _gsSqueakTemp_index + 1].
	^ _gsSqueakTemp_flags