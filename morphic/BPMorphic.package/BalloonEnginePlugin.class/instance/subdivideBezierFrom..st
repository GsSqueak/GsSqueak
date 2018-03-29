bezier-loading
subdivideBezierFrom: index 
	"Recursively subdivide the curve on the bezier stack."
	| _gsSqueakTemp_otherIndex _gsSqueakTemp_index1 _gsSqueakTemp_index2 |
	_gsSqueakTemp_otherIndex := self subdivideBezier: index.
	_gsSqueakTemp_otherIndex = index
		ifFalse: [_gsSqueakTemp_index1 := self subdivideBezierFrom: index.
			engineStopped
				ifTrue: [^ 0].
			_gsSqueakTemp_index2 := self subdivideBezierFrom: _gsSqueakTemp_otherIndex.
			engineStopped
				ifTrue: [^ 0].
			_gsSqueakTemp_index1 >= _gsSqueakTemp_index2
				ifTrue: [^ _gsSqueakTemp_index1]
				ifFalse: [^ _gsSqueakTemp_index2]].
	^ index