shapes-polygons
loadPolygon: points nPoints: nPoints fill: fillIndex lineWidth: lineWidth lineFill: lineFill pointsShort: isShort 
	| _gsSqueakTemp_x0 _gsSqueakTemp_y0 _gsSqueakTemp_x1 _gsSqueakTemp_y1 |
	isShort
		ifTrue: [_gsSqueakTemp_x0 := self loadPointShortAt: 0 from: points.
			_gsSqueakTemp_y0 := self loadPointShortAt: 1 from: points]
		ifFalse: [_gsSqueakTemp_x0 := self loadPointIntAt: 0 from: points.
			_gsSqueakTemp_y0 := self loadPointIntAt: 1 from: points].
	1
		to: nPoints - 1
		do: [:i | 
			isShort
				ifTrue: [_gsSqueakTemp_x1 := self loadPointShortAt: i * 2 from: points.
					_gsSqueakTemp_y1 := self loadPointShortAt: i * 2 + 1 from: points]
				ifFalse: [_gsSqueakTemp_x1 := self loadPointIntAt: i * 2 from: points.
					_gsSqueakTemp_y1 := self loadPointIntAt: i * 2 + 1 from: points].
			self point1Get at: 0 put: _gsSqueakTemp_x0.
			self point1Get at: 1 put: _gsSqueakTemp_y0.
			self point2Get at: 0 put: _gsSqueakTemp_x1.
			self point2Get at: 1 put: _gsSqueakTemp_y1.
			self transformPoints: 2.
			self
				loadWideLine: lineWidth
				from: self point1Get
				to: self point2Get
				lineFill: lineFill
				leftFill: fillIndex
				rightFill: 0.
			engineStopped
				ifTrue: [^ nil].
			_gsSqueakTemp_x0 := _gsSqueakTemp_x1.
			_gsSqueakTemp_y0 := _gsSqueakTemp_y1]