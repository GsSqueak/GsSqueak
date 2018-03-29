GET processing
getSorts: edge1 before: edge2 
	"Return true if the edge at index i should sort before the edge at index
	j. "
	| _gsSqueakTemp_diff |
	edge1 = edge2
		ifTrue: [^ true].
	"First, sort by Y"
	_gsSqueakTemp_diff := (self edgeYValueOf: edge1)
				- (self edgeYValueOf: edge2).
	_gsSqueakTemp_diff = 0
		ifFalse: [^ _gsSqueakTemp_diff < 0].
	"Then, by X"
	_gsSqueakTemp_diff := (self edgeXValueOf: edge1)
				- (self edgeXValueOf: edge2).
	^ _gsSqueakTemp_diff < 0