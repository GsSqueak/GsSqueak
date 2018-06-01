bezier-loading
loadOval: lineWidth lineFill: lineFill leftFill: leftFill rightFill: rightFill 
	"Load a rectangular oval currently defined by point1/point2"
	| _gsSqueakTemp_w _gsSqueakTemp_h _gsSqueakTemp_cx _gsSqueakTemp_cy _gsSqueakTemp_nSegments |
	_gsSqueakTemp_w := (self point2Get at: 0)
				- (self point1Get at: 0) // 2.
	_gsSqueakTemp_h := (self point2Get at: 1)
				- (self point1Get at: 1) // 2.
	_gsSqueakTemp_cx := (self point2Get at: 0)
				+ (self point1Get at: 0) // 2.
	_gsSqueakTemp_cy := (self point2Get at: 1)
				+ (self point1Get at: 1) // 2.
	0
		to: 15
		do: [:i | 
			self
				loadOvalSegment: i
				w: _gsSqueakTemp_w
				h: _gsSqueakTemp_h
				cx: _gsSqueakTemp_cx
				cy: _gsSqueakTemp_cy.
			self transformPoints: 3.
			_gsSqueakTemp_nSegments := self
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
				n: _gsSqueakTemp_nSegments.
			engineStopped
				ifTrue: [^ nil]]