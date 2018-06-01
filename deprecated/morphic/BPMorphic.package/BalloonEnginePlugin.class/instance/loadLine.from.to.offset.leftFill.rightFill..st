lines-loading
loadLine: line from: point1 to: point2 offset: yOffset leftFill: leftFill rightFill: rightFill 
	"Load the line defined by point1 and point2."
	| _gsSqueakTemp_p1 _gsSqueakTemp_p2 _gsSqueakTemp_yDir |
	(point1 at: 1)
			<= (point2 at: 1)
		ifTrue: [_gsSqueakTemp_p1 := point1.
			_gsSqueakTemp_p2 := point2.
			_gsSqueakTemp_yDir := 1]
		ifFalse: [_gsSqueakTemp_p1 := point2.
			_gsSqueakTemp_p2 := point1.
			_gsSqueakTemp_yDir := -1].
	self
		edgeXValueOf: line
		put: (_gsSqueakTemp_p1 at: 0).
	self edgeYValueOf: line put: (_gsSqueakTemp_p1 at: 1)
			- yOffset.
	self edgeZValueOf: line put: self currentZGet.
	self edgeLeftFillOf: line put: leftFill.
	self edgeRightFillOf: line put: rightFill.
	self
		lineEndXOf: line
		put: (_gsSqueakTemp_p2 at: 0).
	self lineEndYOf: line put: (_gsSqueakTemp_p2 at: 1)
			- yOffset.
	self lineYDirectionOf: line put: _gsSqueakTemp_yDir