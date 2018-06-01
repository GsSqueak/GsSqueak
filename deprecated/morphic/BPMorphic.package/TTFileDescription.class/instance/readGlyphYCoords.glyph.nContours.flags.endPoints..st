glyphs
readGlyphYCoords: fontFile glyph: glyph nContours: nContours flags: flags endPoints: endPts 
	"Read the y coordinates for the given glyph from the font file."
	| _gsSqueakTemp_startPoint _gsSqueakTemp_endPoint _gsSqueakTemp_flagBits _gsSqueakTemp_yValue _gsSqueakTemp_contour _gsSqueakTemp_ttPoint |
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
					"Check if this value one or two byte encoded"
					(_gsSqueakTemp_flagBits bitAnd: 4)
							= 4
						ifTrue: ["one byte"
							_gsSqueakTemp_yValue := fontFile next.
							_gsSqueakTemp_yValue := (_gsSqueakTemp_flagBits bitAnd: 32)
											= 32
										ifTrue: [_gsSqueakTemp_yValue]
										ifFalse: [_gsSqueakTemp_yValue negated].
							_gsSqueakTemp_ttPoint y: _gsSqueakTemp_yValue]
						ifFalse: ["two byte"
							(_gsSqueakTemp_flagBits bitAnd: 32)
									= 32
								ifTrue: [_gsSqueakTemp_ttPoint y: 0]
								ifFalse: [_gsSqueakTemp_yValue := self
												short: (fontFile nextNumber: 2).
									_gsSqueakTemp_ttPoint y: _gsSqueakTemp_yValue]]].
			_gsSqueakTemp_startPoint := _gsSqueakTemp_endPoint + 1]