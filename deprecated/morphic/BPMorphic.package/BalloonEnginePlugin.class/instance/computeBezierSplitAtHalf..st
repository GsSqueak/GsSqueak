bezier-loading
computeBezierSplitAtHalf: index 
	"Split the bezier curve at 0.5."
	| _gsSqueakTemp_startX _gsSqueakTemp_startY _gsSqueakTemp_viaX _gsSqueakTemp_viaY _gsSqueakTemp_endX _gsSqueakTemp_endY _gsSqueakTemp_newIndex _gsSqueakTemp_leftViaX _gsSqueakTemp_leftViaY _gsSqueakTemp_rightViaX _gsSqueakTemp_rightViaY _gsSqueakTemp_sharedX _gsSqueakTemp_sharedY |
	_gsSqueakTemp_newIndex := self allocateBezierStackEntry.
	engineStopped
		ifTrue: [^ 0].
	"Something went wrong"
	_gsSqueakTemp_leftViaX := _gsSqueakTemp_startX := self bzStartX: index.
	_gsSqueakTemp_leftViaY := _gsSqueakTemp_startY := self bzStartY: index.
	_gsSqueakTemp_rightViaX := _gsSqueakTemp_viaX := self bzViaX: index.
	_gsSqueakTemp_rightViaY := _gsSqueakTemp_viaY := self bzViaY: index.
	_gsSqueakTemp_endX := self bzEndX: index.
	_gsSqueakTemp_endY := self bzEndY: index.
	"Compute intermediate points"
	_gsSqueakTemp_leftViaX := _gsSqueakTemp_leftViaX + (_gsSqueakTemp_viaX - _gsSqueakTemp_startX // 2).
	_gsSqueakTemp_leftViaY := _gsSqueakTemp_leftViaY + (_gsSqueakTemp_viaY - _gsSqueakTemp_startY // 2).
	_gsSqueakTemp_sharedX := _gsSqueakTemp_rightViaX := _gsSqueakTemp_rightViaX + (_gsSqueakTemp_endX - _gsSqueakTemp_viaX // 2).
	_gsSqueakTemp_sharedY := _gsSqueakTemp_rightViaY := _gsSqueakTemp_rightViaY + (_gsSqueakTemp_endY - _gsSqueakTemp_viaY // 2).
	"Compute new shared point"
	_gsSqueakTemp_sharedX := _gsSqueakTemp_sharedX + (_gsSqueakTemp_leftViaX - _gsSqueakTemp_rightViaX // 2).
	_gsSqueakTemp_sharedY := _gsSqueakTemp_sharedY + (_gsSqueakTemp_leftViaY - _gsSqueakTemp_rightViaY // 2).
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