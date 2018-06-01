fills-gradient
loadFillOrientation: fill from: point1 along: point2 normal: point3 width: fillWidth height: fillHeight 
	"Transform the points"
	| _gsSqueakTemp_dirX _gsSqueakTemp_dirY _gsSqueakTemp_nrmX _gsSqueakTemp_nrmY _gsSqueakTemp_dsLength2 _gsSqueakTemp_dsX _gsSqueakTemp_dsY _gsSqueakTemp_dtLength2 _gsSqueakTemp_dtX _gsSqueakTemp_dtY |
	point2 at: 0 put: (point2 at: 0)
			+ (point1 at: 0).
	point2 at: 1 put: (point2 at: 1)
			+ (point1 at: 1).
	point3 at: 0 put: (point3 at: 0)
			+ (point1 at: 0).
	point3 at: 1 put: (point3 at: 1)
			+ (point1 at: 1).
	self transformPoint: point1.
	self transformPoint: point2.
	self transformPoint: point3.
	_gsSqueakTemp_dirX := (point2 at: 0)
				- (point1 at: 0).
	_gsSqueakTemp_dirY := (point2 at: 1)
				- (point1 at: 1).
	_gsSqueakTemp_nrmX := (point3 at: 0)
				- (point1 at: 0).
	_gsSqueakTemp_nrmY := (point3 at: 1)
				- (point1 at: 1).
	"Compute the scale from direction/normal into ramp size"
	_gsSqueakTemp_dsLength2 := _gsSqueakTemp_dirX * _gsSqueakTemp_dirX + (_gsSqueakTemp_dirY * _gsSqueakTemp_dirY).
	_gsSqueakTemp_dsLength2 > 0
		ifTrue: [_gsSqueakTemp_dsX := (_gsSqueakTemp_dirX asFloat * fillWidth asFloat * 65536.0 / _gsSqueakTemp_dsLength2 asFloat) asInteger.
			_gsSqueakTemp_dsY := (_gsSqueakTemp_dirY asFloat * fillWidth asFloat * 65536.0 / _gsSqueakTemp_dsLength2 asFloat) asInteger]
		ifFalse: [_gsSqueakTemp_dsX := 0.
			_gsSqueakTemp_dsY := 0].
	_gsSqueakTemp_dtLength2 := _gsSqueakTemp_nrmX * _gsSqueakTemp_nrmX + (_gsSqueakTemp_nrmY * _gsSqueakTemp_nrmY).
	_gsSqueakTemp_dtLength2 > 0
		ifTrue: [_gsSqueakTemp_dtX := (_gsSqueakTemp_nrmX asFloat * fillHeight asFloat * 65536.0 / _gsSqueakTemp_dtLength2 asFloat) asInteger.
			_gsSqueakTemp_dtY := (_gsSqueakTemp_nrmY asFloat * fillHeight asFloat * 65536.0 / _gsSqueakTemp_dtLength2 asFloat) asInteger]
		ifFalse: [_gsSqueakTemp_dtX := 0.
			_gsSqueakTemp_dtY := 0].
	self
		fillOriginXOf: fill
		put: (point1 at: 0).
	self
		fillOriginYOf: fill
		put: (point1 at: 1).
	self fillDirectionXOf: fill put: _gsSqueakTemp_dsX.
	self fillDirectionYOf: fill put: _gsSqueakTemp_dsY.
	self fillNormalXOf: fill put: _gsSqueakTemp_dtX.
	self fillNormalYOf: fill put: _gsSqueakTemp_dtY