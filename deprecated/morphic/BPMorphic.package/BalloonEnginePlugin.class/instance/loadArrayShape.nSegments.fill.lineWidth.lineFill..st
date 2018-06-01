shapes-polygons
loadArrayShape: points nSegments: nSegments fill: fillIndex lineWidth: lineWidth lineFill: lineFill 
	| _gsSqueakTemp_pointOop _gsSqueakTemp_x0 _gsSqueakTemp_y0 _gsSqueakTemp_x1 _gsSqueakTemp_y1 _gsSqueakTemp_x2 _gsSqueakTemp_y2 _gsSqueakTemp_segs |
	0
		to: nSegments - 1
		do: [:i | 
			_gsSqueakTemp_pointOop := interpreterProxy fetchPointer: i * 3 ofObject: points.
			self loadPoint: self point1Get from: _gsSqueakTemp_pointOop.
			_gsSqueakTemp_pointOop := interpreterProxy fetchPointer: i * 3 + 1 ofObject: points.
			self loadPoint: self point2Get from: _gsSqueakTemp_pointOop.
			_gsSqueakTemp_pointOop := interpreterProxy fetchPointer: i * 3 + 2 ofObject: points.
			self loadPoint: self point3Get from: _gsSqueakTemp_pointOop.
			interpreterProxy failed
				ifTrue: [^ nil].
			self transformPoints: 3.
			_gsSqueakTemp_x0 := self point1Get at: 0.
			_gsSqueakTemp_y0 := self point1Get at: 1.
			_gsSqueakTemp_x1 := self point2Get at: 0.
			_gsSqueakTemp_y1 := self point2Get at: 1.
			_gsSqueakTemp_x2 := self point3Get at: 0.
			_gsSqueakTemp_y2 := self point3Get at: 1.
			"Check if we can use a line"
			((_gsSqueakTemp_x0 = _gsSqueakTemp_y0
						and: [_gsSqueakTemp_x1 = _gsSqueakTemp_y1])
					or: [_gsSqueakTemp_x1 = _gsSqueakTemp_x2
							and: [_gsSqueakTemp_y1 = _gsSqueakTemp_y2]])
				ifTrue: [self
						loadWideLine: lineWidth
						from: self point1Get
						to: self point3Get
						lineFill: lineFill
						leftFill: fillIndex
						rightFill: 0]
				ifFalse: ["Need bezier"
					_gsSqueakTemp_segs := self
								loadAndSubdivideBezierFrom: self point1Get
								via: self point2Get
								to: self point3Get
								isWide: (lineWidth ~= 0
										and: [lineFill ~= 0]).
					engineStopped
						ifTrue: [^ nil].
					self
						loadWideBezier: lineWidth
						lineFill: lineFill
						leftFill: fillIndex
						rightFill: 0
						n: _gsSqueakTemp_segs].
			engineStopped
				ifTrue: [^ nil]]