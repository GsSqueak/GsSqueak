bezier-loading
subdivideToBeMonoton: base inX: doTestX 
	"Check if the given bezier curve is monoton in Y, and, if desired in X. 
	If not, subdivide it"
	| _gsSqueakTemp_index1 _gsSqueakTemp_index2 _gsSqueakTemp_base2 |
	_gsSqueakTemp_base2 := _gsSqueakTemp_index1 := _gsSqueakTemp_index2 := self subdivideToBeMonotonInY: base.
	doTestX
		ifTrue: [_gsSqueakTemp_index1 := self subdivideToBeMonotonInX: base].
	_gsSqueakTemp_index1 > _gsSqueakTemp_index2
		ifTrue: [_gsSqueakTemp_index2 := _gsSqueakTemp_index1].
	(base ~= _gsSqueakTemp_base2
			and: [doTestX])
		ifTrue: [_gsSqueakTemp_index1 := self subdivideToBeMonotonInX: _gsSqueakTemp_base2].
	_gsSqueakTemp_index1 > _gsSqueakTemp_index2
		ifTrue: [_gsSqueakTemp_index2 := _gsSqueakTemp_index1].
	^ _gsSqueakTemp_index2