FILL processing
findStackFill: fillIndex depth: depth 
	| _gsSqueakTemp_index |
	_gsSqueakTemp_index := 0.
	[_gsSqueakTemp_index < self stackFillSize
		and: [(self stackFillValue: _gsSqueakTemp_index)
					~= fillIndex
				or: [(self stackFillDepth: _gsSqueakTemp_index)
						~= depth]]]
		whileTrue: [_gsSqueakTemp_index := _gsSqueakTemp_index + self stackFillEntryLength].
	_gsSqueakTemp_index >= self stackFillSize
		ifTrue: [^ -1]
		ifFalse: [^ _gsSqueakTemp_index]