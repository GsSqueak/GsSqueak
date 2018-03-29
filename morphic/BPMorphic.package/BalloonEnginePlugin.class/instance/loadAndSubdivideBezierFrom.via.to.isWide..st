bezier-loading
loadAndSubdivideBezierFrom: point1 via: point2 to: point3 isWide: wideFlag 
	"Load and subdivide the bezier curve from point1/point2/point3.
	If wideFlag is set then make sure the curve is monoton in X."
	| _gsSqueakTemp_bz1 _gsSqueakTemp_bz2 _gsSqueakTemp_index2 _gsSqueakTemp_index1 |
	_gsSqueakTemp_bz1 := self allocateBezierStackEntry.
	engineStopped
		ifTrue: [^ 0].
	"Load point1/point2/point3 on the top of the stack"
	self
		bzStartX: _gsSqueakTemp_bz1
		put: (point1 at: 0).
	self
		bzStartY: _gsSqueakTemp_bz1
		put: (point1 at: 1).
	self
		bzViaX: _gsSqueakTemp_bz1
		put: (point2 at: 0).
	self
		bzViaY: _gsSqueakTemp_bz1
		put: (point2 at: 1).
	self
		bzEndX: _gsSqueakTemp_bz1
		put: (point3 at: 0).
	self
		bzEndY: _gsSqueakTemp_bz1
		put: (point3 at: 1).
	"Now check if the bezier curve is monoton. If not, subdivide it."
	_gsSqueakTemp_index2 := _gsSqueakTemp_bz2 := self subdivideToBeMonoton: _gsSqueakTemp_bz1 inX: wideFlag.
	_gsSqueakTemp_bz1
		to: _gsSqueakTemp_bz2
		by: 6
		do: [:index | 
			_gsSqueakTemp_index1 := self subdivideBezierFrom: index.
			_gsSqueakTemp_index1 > _gsSqueakTemp_index2
				ifTrue: [_gsSqueakTemp_index2 := _gsSqueakTemp_index1].
			engineStopped
				ifTrue: [^ 0]].
	"Return the number of segments"
	^ _gsSqueakTemp_index2 // 6