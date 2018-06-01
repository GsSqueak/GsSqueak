bezier-loading
loadOvalSegment: seg w: w h: h cx: cx cy: cy 
	| _gsSqueakTemp_x0 _gsSqueakTemp_y0 _gsSqueakTemp_x2 _gsSqueakTemp_y2 _gsSqueakTemp_x1 _gsSqueakTemp_y1 |
	"Load start point of segment"
	_gsSqueakTemp_x0 := ((self circleCosTable at: seg * 2 + 0)
				* w asFloat + cx) asInteger.
	_gsSqueakTemp_y0 := ((self circleSinTable at: seg * 2 + 0)
				* h asFloat + cy) asInteger.
	self point1Get at: 0 put: _gsSqueakTemp_x0.
	self point1Get at: 1 put: _gsSqueakTemp_y0.
	"Load end point of segment"
	_gsSqueakTemp_x2 := ((self circleCosTable at: seg * 2 + 2)
				* w asFloat + cx) asInteger.
	_gsSqueakTemp_y2 := ((self circleSinTable at: seg * 2 + 2)
				* h asFloat + cy) asInteger.
	self point3Get at: 0 put: _gsSqueakTemp_x2.
	self point3Get at: 1 put: _gsSqueakTemp_y2.
	"Load intermediate point of segment"
	_gsSqueakTemp_x1 := ((self circleCosTable at: seg * 2 + 1)
				* w asFloat + cx) asInteger.
	_gsSqueakTemp_y1 := ((self circleSinTable at: seg * 2 + 1)
				* h asFloat + cy) asInteger.
	"NOTE: The intermediate point is the point ON the curve
	and not yet the control point (which is OFF the curve)"
	_gsSqueakTemp_x1 := _gsSqueakTemp_x1 * 2 - (_gsSqueakTemp_x0 + _gsSqueakTemp_x2 // 2).
	_gsSqueakTemp_y1 := _gsSqueakTemp_y1 * 2 - (_gsSqueakTemp_y0 + _gsSqueakTemp_y2 // 2).
	self point2Get at: 0 put: _gsSqueakTemp_x1.
	self point2Get at: 1 put: _gsSqueakTemp_y1