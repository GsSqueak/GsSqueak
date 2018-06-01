glyphs
readGlyphXCoords: fontFile glyph: glyph nContours: nContours flags: flags endPoints: endPts 
	"Read the x coordinates for the given glyph from the font file."
	| _gsSqueakTemp_startPoint _gsSqueakTemp_endPoint _gsSqueakTemp_flagBits _gsSqueakTemp_xValue _gsSqueakTemp_contour _gsSqueakTemp_ttPoint |
	_gsSqueakTemp_startPoint := 1.
	1
		to: nContours
		do: [:i | 
			_gsSqueakTemp_contour := glyph contours at: i.
			"Get the end point"
			_gsSqueakTemp_endPoint := (endPts at: i)
						+ 1.
			"Store number of points"
			_gsSqueakTemp_startPoint
				to: _gsSqueakTemp_endPoint
				do: [:j | 
					_gsSqueakTemp_ttPoint := _gsSqueakTemp_contour points at: j - _gsSqueakTemp_startPoint + 1.
					_gsSqueakTemp_flagBits := flags at: j.
					"If bit zero in the flag is set then this point is an
					on-curve point, if not, then it is an off-curve point."
					(_gsSqueakTemp_flagBits bitAnd: 1)
							= 1
						ifTrue: [_gsSqueakTemp_ttPoint type: #OnCurve]
						ifFalse: [_gsSqueakTemp_ttPoint type: #OffCurve].
					"First we check to see if bit one is set. This would
					indicate that
					the corresponding coordinate data in the table is 1
					byte long.
					If the bit is not set, then the coordinate data is 2
					bytes long."
					(_gsSqueakTemp_flagBits bitAnd: 2)
							= 2
						ifTrue: ["one byte"
							_gsSqueakTemp_xValue := fontFile next.
							_gsSqueakTemp_xValue := (_gsSqueakTemp_flagBits bitAnd: 16)
											= 16
										ifTrue: [_gsSqueakTemp_xValue]
										ifFalse: [_gsSqueakTemp_xValue negated].
							_gsSqueakTemp_ttPoint x: _gsSqueakTemp_xValue]
						ifFalse: ["two byte"
							"If bit four is set, then this coordinate is the
							same as the
							last one, so the relative offset (of zero) is
							stored. If bit
							is not set, then read in two bytes and store it
							as a signed value."
							(_gsSqueakTemp_flagBits bitAnd: 16)
									= 16
								ifTrue: [_gsSqueakTemp_ttPoint x: 0]
								ifFalse: [_gsSqueakTemp_xValue := self
												short: (fontFile nextNumber: 2).
									_gsSqueakTemp_ttPoint x: _gsSqueakTemp_xValue]]].
			_gsSqueakTemp_startPoint := _gsSqueakTemp_endPoint + 1]