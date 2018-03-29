shapes-compressed
loadCompressedSegment: segmentIndex from: points short: pointsShort leftFill: leftFill rightFill: rightFill lineWidth: lineWidth lineColor: lineFill 
	"Load the compressed segment identified by segment index"
	| _gsSqueakTemp_x0 _gsSqueakTemp_y0 _gsSqueakTemp_x1 _gsSqueakTemp_y1 _gsSqueakTemp_x2 _gsSqueakTemp_y2 _gsSqueakTemp_index _gsSqueakTemp_segs |
	"Check if have anything to do at all"
	(leftFill = rightFill
			and: [lineWidth = 0
					or: [lineFill = 0]])
		ifTrue: [^ nil].
	"Nothing to do"
	_gsSqueakTemp_index := segmentIndex * 6.
	"3 points with x/y each"
	pointsShort
		ifTrue: ["Load short points"
			_gsSqueakTemp_x0 := self loadPointShortAt: _gsSqueakTemp_index + 0 from: points.
			_gsSqueakTemp_y0 := self loadPointShortAt: _gsSqueakTemp_index + 1 from: points.
			_gsSqueakTemp_x1 := self loadPointShortAt: _gsSqueakTemp_index + 2 from: points.
			_gsSqueakTemp_y1 := self loadPointShortAt: _gsSqueakTemp_index + 3 from: points.
			_gsSqueakTemp_x2 := self loadPointShortAt: _gsSqueakTemp_index + 4 from: points.
			_gsSqueakTemp_y2 := self loadPointShortAt: _gsSqueakTemp_index + 5 from: points]
		ifFalse: [_gsSqueakTemp_x0 := self loadPointIntAt: _gsSqueakTemp_index + 0 from: points.
			_gsSqueakTemp_y0 := self loadPointIntAt: _gsSqueakTemp_index + 1 from: points.
			_gsSqueakTemp_x1 := self loadPointIntAt: _gsSqueakTemp_index + 2 from: points.
			_gsSqueakTemp_y1 := self loadPointIntAt: _gsSqueakTemp_index + 3 from: points.
			_gsSqueakTemp_x2 := self loadPointIntAt: _gsSqueakTemp_index + 4 from: points.
			_gsSqueakTemp_y2 := self loadPointIntAt: _gsSqueakTemp_index + 5 from: points].
	"Briefly check if can represent the bezier as a line"
	((_gsSqueakTemp_x0 = _gsSqueakTemp_x1
				and: [_gsSqueakTemp_y0 = _gsSqueakTemp_y1])
			or: [_gsSqueakTemp_x1 = _gsSqueakTemp_x2
					and: [_gsSqueakTemp_y1 = _gsSqueakTemp_y2]])
		ifTrue: ["We can use a line from x0/y0 to x2/y2"
			(_gsSqueakTemp_x0 = _gsSqueakTemp_x2
					and: [_gsSqueakTemp_y0 = _gsSqueakTemp_y2])
				ifTrue: [^ nil].
			"Nothing to do"
			"Load and transform points"
			self point1Get at: 0 put: _gsSqueakTemp_x0.
			self point1Get at: 1 put: _gsSqueakTemp_y0.
			self point2Get at: 0 put: _gsSqueakTemp_x2.
			self point2Get at: 1 put: _gsSqueakTemp_y2.
			self transformPoints: 2.
			^ self
				loadWideLine: lineWidth
				from: self point1Get
				to: self point2Get
				lineFill: lineFill
				leftFill: leftFill
				rightFill: rightFill].
	"Need bezier curve"
	"Load and transform points"
	self point1Get at: 0 put: _gsSqueakTemp_x0.
	self point1Get at: 1 put: _gsSqueakTemp_y0.
	self point2Get at: 0 put: _gsSqueakTemp_x1.
	self point2Get at: 1 put: _gsSqueakTemp_y1.
	self point3Get at: 0 put: _gsSqueakTemp_x2.
	self point3Get at: 1 put: _gsSqueakTemp_y2.
	self transformPoints: 3.
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
		leftFill: leftFill
		rightFill: rightFill
		n: _gsSqueakTemp_segs