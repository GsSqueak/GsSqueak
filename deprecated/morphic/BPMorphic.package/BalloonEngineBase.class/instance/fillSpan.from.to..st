displaying
fillSpan: fill from: leftX to: rightX 
	"Fill the span buffer from leftX to rightX with the given fill.
	Clip before performing any operations. Return true if the fill must
	be handled by some Smalltalk code."
	| _gsSqueakTemp_x0 _gsSqueakTemp_x1 _gsSqueakTemp_type |
	fill = 0
		ifTrue: [^ false].
	"Nothing to do"
	"Start from spEnd - we must not paint pixels twice at a scan line"
	leftX < self spanEndAAGet
		ifTrue: [_gsSqueakTemp_x0 := self spanEndAAGet]
		ifFalse: [_gsSqueakTemp_x0 := leftX].
	rightX > (self spanSizeGet << self aaShiftGet)
		ifTrue: [_gsSqueakTemp_x1 := self spanSizeGet << self aaShiftGet]
		ifFalse: [_gsSqueakTemp_x1 := rightX].
	"Clip left and right values"
	_gsSqueakTemp_x0 < self fillMinXGet
		ifTrue: [_gsSqueakTemp_x0 := self fillMinXGet].
	_gsSqueakTemp_x1 > self fillMaxXGet
		ifTrue: [_gsSqueakTemp_x1 := self fillMaxXGet].
	"Adjust start and end values of span"
	_gsSqueakTemp_x0 < self spanStartGet
		ifTrue: [self spanStartPut: _gsSqueakTemp_x0].
	_gsSqueakTemp_x1 > self spanEndGet
		ifTrue: [self spanEndPut: _gsSqueakTemp_x1].
	_gsSqueakTemp_x1 > self spanEndAAGet
		ifTrue: [self spanEndAAPut: _gsSqueakTemp_x1].
	_gsSqueakTemp_x0 >= _gsSqueakTemp_x1
		ifTrue: [^ false].
	"Nothing to do"
	(self isFillColor: fill)
		ifTrue: [self
				fillColorSpan: fill
				from: _gsSqueakTemp_x0
				to: _gsSqueakTemp_x1]
		ifFalse: ["Store the values for the dispatch"
			self lastExportedFillPut: fill.
			self lastExportedLeftXPut: _gsSqueakTemp_x0.
			self lastExportedRightXPut: _gsSqueakTemp_x1.
			_gsSqueakTemp_type := self fillTypeOf: fill.
			_gsSqueakTemp_type <= 1
				ifTrue: [^ true].
			self dispatchOn: _gsSqueakTemp_type in: FillTable].
	^ false