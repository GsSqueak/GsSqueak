bezier-loading
computeBezier: index splitAt: param 
	"Split the bezier curve at the given parametric value.
	Note: Since this method is only invoked to make non-monoton
	beziers monoton we must check for the resulting y values
	to be *really* between the start and end value."
	| _gsSqueakTemp_startX _gsSqueakTemp_startY _gsSqueakTemp_viaX _gsSqueakTemp_viaY _gsSqueakTemp_endX _gsSqueakTemp_endY _gsSqueakTemp_newIndex _gsSqueakTemp_leftViaX _gsSqueakTemp_leftViaY _gsSqueakTemp_rightViaX _gsSqueakTemp_rightViaY _gsSqueakTemp_sharedX _gsSqueakTemp_sharedY |
	_gsSqueakTemp_leftViaX := _gsSqueakTemp_startX := self bzStartX: index.
	_gsSqueakTemp_leftViaY := _gsSqueakTemp_startY := self bzStartY: index.
	_gsSqueakTemp_rightViaX := _gsSqueakTemp_viaX := self bzViaX: index.
	_gsSqueakTemp_rightViaY := _gsSqueakTemp_viaY := self bzViaY: index.
	_gsSqueakTemp_endX := self bzEndX: index.
	_gsSqueakTemp_endY := self bzEndY: index.
	"Compute intermediate points"
	_gsSqueakTemp_sharedX := _gsSqueakTemp_leftViaX := _gsSqueakTemp_leftViaX + ((_gsSqueakTemp_viaX - _gsSqueakTemp_startX) asFloat * param) asInteger.
	_gsSqueakTemp_sharedY := _gsSqueakTemp_leftViaY := _gsSqueakTemp_leftViaY + ((_gsSqueakTemp_viaY - _gsSqueakTemp_startY) asFloat * param) asInteger.
	_gsSqueakTemp_rightViaX := _gsSqueakTemp_rightViaX + ((_gsSqueakTemp_endX - _gsSqueakTemp_viaX) asFloat * param) asInteger.
	_gsSqueakTemp_rightViaY := _gsSqueakTemp_rightViaY + ((_gsSqueakTemp_endY - _gsSqueakTemp_viaY) asFloat * param) asInteger.
	"Compute new shared point"
	_gsSqueakTemp_sharedX := _gsSqueakTemp_sharedX + ((_gsSqueakTemp_rightViaX - _gsSqueakTemp_leftViaX) asFloat * param) asInteger.
	_gsSqueakTemp_sharedY := _gsSqueakTemp_sharedY + ((_gsSqueakTemp_rightViaY - _gsSqueakTemp_leftViaY) asFloat * param) asInteger.
	"Check the new via points"
	_gsSqueakTemp_leftViaY := self
				assureValue: _gsSqueakTemp_leftViaY
				between: _gsSqueakTemp_startY
				and: _gsSqueakTemp_sharedY.
	_gsSqueakTemp_rightViaY := self
				assureValue: _gsSqueakTemp_rightViaY
				between: _gsSqueakTemp_sharedY
				and: _gsSqueakTemp_endY.
	_gsSqueakTemp_newIndex := self allocateBezierStackEntry.
	engineStopped
		ifTrue: [^ 0].
	"Something went wrong"
	"Store the first part back"
	self bzViaX: index put: _gsSqueakTemp_leftViaX.
	self bzViaY: index put: _gsSqueakTemp_leftViaY.
	self bzEndX: index put: _gsSqueakTemp_sharedX.
	self bzEndY: index put: _gsSqueakTemp_sharedY.
	"Store the second point back"
	self bzStartX: _gsSqueakTemp_newIndex put: _gsSqueakTemp_sharedX.
	self bzStartY: _gsSqueakTemp_newIndex put: _gsSqueakTemp_sharedY.
	self bzViaX: _gsSqueakTemp_newIndex put: _gsSqueakTemp_rightViaX.
	self bzViaY: _gsSqueakTemp_newIndex put: _gsSqueakTemp_rightViaY.
	self bzEndX: _gsSqueakTemp_newIndex put: _gsSqueakTemp_endX.
	self bzEndY: _gsSqueakTemp_newIndex put: _gsSqueakTemp_endY.
	^ _gsSqueakTemp_newIndex