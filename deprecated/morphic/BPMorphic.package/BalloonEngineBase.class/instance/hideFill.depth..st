FILL processing
hideFill: fillIndex depth: depth 
	"Make the fill style with the given index invisible"
	| _gsSqueakTemp_index _gsSqueakTemp_newTopIndex _gsSqueakTemp_newTop _gsSqueakTemp_newDepth _gsSqueakTemp_newRightX |
	_gsSqueakTemp_index := self findStackFill: fillIndex depth: depth.
	_gsSqueakTemp_index = -1
		ifTrue: [^ false].
	_gsSqueakTemp_index = 0
		ifTrue: [self freeStackFillEntry.
			^ true].
	"Fill is visible - replace it with the last entry on the stack"
	self
		stackFillValue: _gsSqueakTemp_index
		put: (self stackFillValue: 0).
	self
		stackFillDepth: _gsSqueakTemp_index
		put: (self stackFillDepth: 0).
	self
		stackFillRightX: _gsSqueakTemp_index
		put: (self stackFillRightX: 0).
	self freeStackFillEntry.
	self stackFillSize <= self stackFillEntryLength
		ifTrue: [^ true].
	"Done"
	"Find the new top fill"
	_gsSqueakTemp_newTopIndex := 0.
	_gsSqueakTemp_index := self stackFillEntryLength.
	[_gsSqueakTemp_index < self stackFillSize]
		whileTrue: [(self fillSorts: _gsSqueakTemp_index before: _gsSqueakTemp_newTopIndex)
				ifTrue: [_gsSqueakTemp_newTopIndex := _gsSqueakTemp_index].
			_gsSqueakTemp_index := _gsSqueakTemp_index + self stackFillEntryLength].
	_gsSqueakTemp_newTopIndex + self stackFillEntryLength = self stackFillSize
		ifTrue: [^ true].
	"Top fill not changed"
	_gsSqueakTemp_newTop := self stackFillValue: _gsSqueakTemp_newTopIndex.
	self stackFillValue: _gsSqueakTemp_newTopIndex put: self topFillValue.
	self topFillValuePut: _gsSqueakTemp_newTop.
	_gsSqueakTemp_newDepth := self stackFillDepth: _gsSqueakTemp_newTopIndex.
	self stackFillDepth: _gsSqueakTemp_newTopIndex put: self topFillDepth.
	self topFillDepthPut: _gsSqueakTemp_newDepth.
	_gsSqueakTemp_newRightX := self stackFillRightX: _gsSqueakTemp_newTopIndex.
	self stackFillRightX: _gsSqueakTemp_newTopIndex put: self topFillRightX.
	self topFillRightXPut: _gsSqueakTemp_newRightX.
	^ true