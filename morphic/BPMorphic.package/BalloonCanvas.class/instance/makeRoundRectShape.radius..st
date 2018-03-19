private
makeRoundRectShape: aRectangle radius: radius 
	"decompose a rounded rectangle into bezier form"
	| _gsSqueakTemp_ovalDiameter _gsSqueakTemp_rectExtent _gsSqueakTemp_segments _gsSqueakTemp_points _gsSqueakTemp_endPoint _gsSqueakTemp_seg _gsSqueakTemp_idx _gsSqueakTemp_offset _gsSqueakTemp_rectOffset |
	_gsSqueakTemp_ovalDiameter := (radius * 2) asPoint min: aRectangle extent.
	(_gsSqueakTemp_ovalDiameter x <= 0
			or: [_gsSqueakTemp_ovalDiameter y <= 0])
		ifTrue: [| topLeft topRight bottomLeft bottomRight |
			"degenerates into rectangle - just hand back four lines"
			topLeft := aRectangle topLeft.
			topRight := aRectangle topRight.
			bottomLeft := aRectangle bottomLeft.
			bottomRight := aRectangle bottomRight.
			_gsSqueakTemp_points := Array new: 4 * 3.
			_gsSqueakTemp_points at: 1 put: topLeft.
			_gsSqueakTemp_points at: 2 put: topLeft.
			_gsSqueakTemp_points at: 3 put: topRight.
			_gsSqueakTemp_points at: 4 put: topRight.
			_gsSqueakTemp_points at: 5 put: topRight.
			_gsSqueakTemp_points at: 6 put: bottomRight.
			_gsSqueakTemp_points at: 7 put: bottomRight.
			_gsSqueakTemp_points at: 8 put: bottomRight.
			_gsSqueakTemp_points at: 9 put: bottomLeft.
			_gsSqueakTemp_points at: 10 put: bottomLeft.
			_gsSqueakTemp_points at: 11 put: bottomLeft.
			_gsSqueakTemp_points at: 12 put: topLeft.
			^ _gsSqueakTemp_points].
	_gsSqueakTemp_rectExtent := aRectangle extent - _gsSqueakTemp_ovalDiameter.
	_gsSqueakTemp_rectOffset := aRectangle origin.
	_gsSqueakTemp_segments := Bezier2Segment
				makeEllipseSegments: (0 @ 0 extent: _gsSqueakTemp_ovalDiameter).
	"patch up the segments to include lines connecting the oval parts.
	we need: 8*3 points for the oval parts + 4*3 points for the connecting
	lines "
	_gsSqueakTemp_points := Array new: 12 * 3.
	_gsSqueakTemp_idx := 0.
	"Tweaked offsets to clean up curves. MAD"
	_gsSqueakTemp_endPoint := _gsSqueakTemp_segments last end + _gsSqueakTemp_rectOffset + (0 @ -1).
	1
		to: 8
		by: 2
		do: [:i | 
			i = 1
				ifTrue: [_gsSqueakTemp_offset := _gsSqueakTemp_rectOffset + (_gsSqueakTemp_rectExtent x @ 0) + (1 @ -1)].
			"top, tr"
			i = 3
				ifTrue: [_gsSqueakTemp_offset := _gsSqueakTemp_rectOffset + _gsSqueakTemp_rectExtent + (1 @ 1)].
			"right, br"
			i = 5
				ifTrue: [_gsSqueakTemp_offset := _gsSqueakTemp_rectOffset + (0 @ _gsSqueakTemp_rectExtent y) + (0 @ 1)].
			"bottom, bl"
			i = 7
				ifTrue: [_gsSqueakTemp_offset := _gsSqueakTemp_rectOffset + (0 @ -1)].
			"left, tl"
			_gsSqueakTemp_seg := _gsSqueakTemp_segments at: i.
			"insert a line segment for the horizontal part of the round rect"
			_gsSqueakTemp_points at: (_gsSqueakTemp_idx := _gsSqueakTemp_idx + 1) put: _gsSqueakTemp_endPoint.
			_gsSqueakTemp_points at: (_gsSqueakTemp_idx := _gsSqueakTemp_idx + 1) put: _gsSqueakTemp_endPoint.
			_gsSqueakTemp_points at: (_gsSqueakTemp_idx := _gsSqueakTemp_idx + 1) put: _gsSqueakTemp_seg start + _gsSqueakTemp_offset.
			"now the first half-arc"
			_gsSqueakTemp_points at: (_gsSqueakTemp_idx := _gsSqueakTemp_idx + 1) put: _gsSqueakTemp_seg start + _gsSqueakTemp_offset.
			_gsSqueakTemp_points at: (_gsSqueakTemp_idx := _gsSqueakTemp_idx + 1) put: _gsSqueakTemp_seg via + _gsSqueakTemp_offset.
			_gsSqueakTemp_points at: (_gsSqueakTemp_idx := _gsSqueakTemp_idx + 1) put: _gsSqueakTemp_seg end + _gsSqueakTemp_offset.
			"the second half-arc"
			_gsSqueakTemp_seg := _gsSqueakTemp_segments at: i + 1.
			_gsSqueakTemp_points at: (_gsSqueakTemp_idx := _gsSqueakTemp_idx + 1) put: _gsSqueakTemp_seg start + _gsSqueakTemp_offset.
			_gsSqueakTemp_points at: (_gsSqueakTemp_idx := _gsSqueakTemp_idx + 1) put: _gsSqueakTemp_seg via + _gsSqueakTemp_offset.
			_gsSqueakTemp_points at: (_gsSqueakTemp_idx := _gsSqueakTemp_idx + 1) put: _gsSqueakTemp_seg end + _gsSqueakTemp_offset.
			_gsSqueakTemp_endPoint := _gsSqueakTemp_seg end + _gsSqueakTemp_offset].
	^ _gsSqueakTemp_points