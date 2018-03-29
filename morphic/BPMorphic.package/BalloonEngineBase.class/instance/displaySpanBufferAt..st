displaying
displaySpanBufferAt: y 
	"Display the span buffer at the current scan line."
	| _gsSqueakTemp_targetX0 _gsSqueakTemp_targetX1 _gsSqueakTemp_targetY |
	"self aaLevelGet > 1 ifTrue:[self adjustAALevel]."
	_gsSqueakTemp_targetX0 := self spanStartGet >> self aaShiftGet.
	_gsSqueakTemp_targetX0 < self clipMinXGet
		ifTrue: [_gsSqueakTemp_targetX0 := self clipMinXGet].
	_gsSqueakTemp_targetX1 := self spanEndGet + self aaLevelGet - 1 >> self aaShiftGet.
	_gsSqueakTemp_targetX1 > self clipMaxXGet
		ifTrue: [_gsSqueakTemp_targetX1 := self clipMaxXGet].
	_gsSqueakTemp_targetY := y >> self aaShiftGet.
	(_gsSqueakTemp_targetY < self clipMinYGet
			or: [_gsSqueakTemp_targetY >= self clipMaxYGet
					or: [_gsSqueakTemp_targetX1 < self clipMinXGet
							or: [_gsSqueakTemp_targetX0 >= self clipMaxXGet]]])
		ifTrue: [^ 0].
	self
		copyBitsFrom: _gsSqueakTemp_targetX0
		to: _gsSqueakTemp_targetX1
		at: _gsSqueakTemp_targetY