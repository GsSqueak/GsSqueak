TODO
line: point1 to: point2 brushForm: brush 
	"Who's gonna use this?"
	| _gsSqueakTemp_pt1 _gsSqueakTemp_pt2 |
	self flush.
	"Sorry, but necessary..."
	transform
		ifNil: [_gsSqueakTemp_pt1 := point1.
			_gsSqueakTemp_pt2 := point2]
		ifNotNil: [_gsSqueakTemp_pt1 := transform localPointToGlobal: point1.
			_gsSqueakTemp_pt2 := transform localPointToGlobal: point2].
	^ super
		line: _gsSqueakTemp_pt1
		to: _gsSqueakTemp_pt2
		brushForm: brush