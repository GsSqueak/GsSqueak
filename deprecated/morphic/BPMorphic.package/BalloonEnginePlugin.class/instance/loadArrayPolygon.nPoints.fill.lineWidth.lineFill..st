shapes-polygons
loadArrayPolygon: points nPoints: nPoints fill: fillIndex lineWidth: lineWidth lineFill: lineFill 
	| _gsSqueakTemp_x0 _gsSqueakTemp_y0 _gsSqueakTemp_x1 _gsSqueakTemp_y1 |
	self
		loadPoint: self point1Get
		from: (interpreterProxy fetchPointer: 0 ofObject: points).
	interpreterProxy failed
		ifTrue: [^ nil].
	_gsSqueakTemp_x0 := self point1Get at: 0.
	_gsSqueakTemp_y0 := self point1Get at: 1.
	1
		to: nPoints - 1
		do: [:i | 
			self
				loadPoint: self point1Get
				from: (interpreterProxy fetchPointer: i ofObject: points).
			interpreterProxy failed
				ifTrue: [^ nil].
			_gsSqueakTemp_x1 := self point1Get at: 0.
			_gsSqueakTemp_y1 := self point1Get at: 1.
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