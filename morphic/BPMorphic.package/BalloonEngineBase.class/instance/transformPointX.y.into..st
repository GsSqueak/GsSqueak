transforming
transformPointX: xValue y: yValue into: dstPoint 
	"Transform srcPoint into dstPoint by using the currently loaded matrix"
	"Note: This should be rewritten so that inlining works (e.g., removing
	the declarations and adding argument coercions at the appropriate
	points) "
	| _gsSqueakTemp_x _gsSqueakTemp_y _gsSqueakTemp_transform |
	_gsSqueakTemp_transform := self edgeTransform.
	_gsSqueakTemp_x := ((_gsSqueakTemp_transform at: 0)
				* xValue + ((_gsSqueakTemp_transform at: 1)
					* yValue)
				+ (_gsSqueakTemp_transform at: 2) * self aaLevelGet asFloat) asInteger.
	_gsSqueakTemp_y := ((_gsSqueakTemp_transform at: 3)
				* xValue + ((_gsSqueakTemp_transform at: 4)
					* yValue)
				+ (_gsSqueakTemp_transform at: 5) * self aaLevelGet asFloat) asInteger.
	dstPoint at: 0 put: _gsSqueakTemp_x.
	dstPoint at: 1 put: _gsSqueakTemp_y