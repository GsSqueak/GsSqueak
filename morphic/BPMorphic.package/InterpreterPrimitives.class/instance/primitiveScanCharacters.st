I/O primitives
primitiveScanCharacters
	"The character scanner primitive."
	| _gsSqueakTemp_kernDelta _gsSqueakTemp_stops _gsSqueakTemp_sourceString _gsSqueakTemp_scanStopIndex _gsSqueakTemp_scanStartIndex _gsSqueakTemp_rcvr _gsSqueakTemp_scanDestX _gsSqueakTemp_scanLastIndex _gsSqueakTemp_scanXTable _gsSqueakTemp_scanMap _gsSqueakTemp_maxGlyph _gsSqueakTemp_ascii _gsSqueakTemp_stopReason _gsSqueakTemp_glyphIndex _gsSqueakTemp_sourceX _gsSqueakTemp_sourceX2 _gsSqueakTemp_nextDestX _gsSqueakTemp_scanRightX _gsSqueakTemp_nilOop |
	self methodArgumentCount = 6
		ifFalse: [^ self primitiveFail].
	"Load the receiver and arguments"
	_gsSqueakTemp_kernDelta := self stackIntegerValue: 0.
	_gsSqueakTemp_stops := self stackValue: 1.
	_gsSqueakTemp_scanRightX := self stackIntegerValue: 2.
	_gsSqueakTemp_sourceString := self stackValue: 3.
	_gsSqueakTemp_scanStopIndex := self stackIntegerValue: 4.
	_gsSqueakTemp_scanStartIndex := self stackIntegerValue: 5.
	_gsSqueakTemp_rcvr := self stackValue: 6.
	self successful
		ifFalse: [^ nil].
	"check argument type and range and rcvr"
	((objectMemory isArray: _gsSqueakTemp_stops)
			and: [(objectMemory slotSizeOf: _gsSqueakTemp_stops)
						>= 258
					and: [(objectMemory isBytes: _gsSqueakTemp_sourceString)
							and: [_gsSqueakTemp_scanStartIndex > 0
									and: [_gsSqueakTemp_scanStopIndex > 0
											and: [_gsSqueakTemp_scanStopIndex
														<= (objectMemory byteSizeOf: _gsSqueakTemp_sourceString)
													and: [(objectMemory isPointers: _gsSqueakTemp_rcvr)
															and: [(objectMemory slotSizeOf: _gsSqueakTemp_rcvr)
																	>= 4]]]]]]])
		ifFalse: [^ self primitiveFail].
	"Check required rcvr instVars"
	_gsSqueakTemp_scanDestX := self fetchInteger: 0 ofObject: _gsSqueakTemp_rcvr.
	_gsSqueakTemp_scanLastIndex := self fetchInteger: 1 ofObject: _gsSqueakTemp_rcvr.
	_gsSqueakTemp_scanXTable := objectMemory fetchPointer: 2 ofObject: _gsSqueakTemp_rcvr.
	_gsSqueakTemp_scanMap := objectMemory fetchPointer: 3 ofObject: _gsSqueakTemp_rcvr.
	((objectMemory isArray: _gsSqueakTemp_scanXTable)
			and: [(objectMemory isArray: _gsSqueakTemp_scanMap)
					and: [(objectMemory slotSizeOf: _gsSqueakTemp_scanMap)
								= 256
							and: [self successful
								"for the fetchInteger:ofObject:'s above"]]])
		ifFalse: [^ self primitiveFail].
	_gsSqueakTemp_maxGlyph := (objectMemory slotSizeOf: _gsSqueakTemp_scanXTable)
				- 2.
	"Okay, here we go. We have eliminated nearly all failure 
	conditions, to optimize the inner fetches."
	_gsSqueakTemp_scanLastIndex := _gsSqueakTemp_scanStartIndex.
	_gsSqueakTemp_nilOop := objectMemory nilObject.
	[_gsSqueakTemp_scanLastIndex <= _gsSqueakTemp_scanStopIndex]
		whileTrue: ["Known to be okay since scanStartIndex > 0 and
			scanStopIndex <= sourceString size"
			_gsSqueakTemp_ascii := objectMemory fetchByte: _gsSqueakTemp_scanLastIndex - 1 ofObject: _gsSqueakTemp_sourceString.
			"Known to be okay since stops size >= 258"
			(_gsSqueakTemp_stopReason := objectMemory fetchPointer: _gsSqueakTemp_ascii ofObject: _gsSqueakTemp_stops) = _gsSqueakTemp_nilOop
				ifFalse: ["Store everything back and get out of here since some
					stop conditionn needs to be checked"
					(objectMemory isIntegerValue: _gsSqueakTemp_scanDestX)
						ifFalse: [^ self primitiveFail].
					self
						storeInteger: 0
						ofObject: _gsSqueakTemp_rcvr
						withValue: _gsSqueakTemp_scanDestX.
					self
						storeInteger: 1
						ofObject: _gsSqueakTemp_rcvr
						withValue: _gsSqueakTemp_scanLastIndex.
					self pop: 7 thenPush: _gsSqueakTemp_stopReason.
					"args+rcvr"
					^ nil].
			"Known to be okay since scanMap size = 256"
			_gsSqueakTemp_glyphIndex := self fetchInteger: _gsSqueakTemp_ascii ofObject: _gsSqueakTemp_scanMap.
			"fail if the glyphIndex is out of range"
			(self failed
					or: [_gsSqueakTemp_glyphIndex < 0
							or: [_gsSqueakTemp_glyphIndex > _gsSqueakTemp_maxGlyph]])
				ifTrue: [^ self primitiveFail].
			_gsSqueakTemp_sourceX := self fetchInteger: _gsSqueakTemp_glyphIndex ofObject: _gsSqueakTemp_scanXTable.
			_gsSqueakTemp_sourceX2 := self fetchInteger: _gsSqueakTemp_glyphIndex + 1 ofObject: _gsSqueakTemp_scanXTable.
			"Above may fail if non-integer entries in scanXTable"
			self failed
				ifTrue: [^ nil].
			_gsSqueakTemp_nextDestX := _gsSqueakTemp_scanDestX + _gsSqueakTemp_sourceX2 - _gsSqueakTemp_sourceX.
			_gsSqueakTemp_nextDestX > _gsSqueakTemp_scanRightX
				ifTrue: ["Store everything back and get out of here since we
					got to the right edge"
					(objectMemory isIntegerValue: _gsSqueakTemp_scanDestX)
						ifFalse: [^ self primitiveFail].
					self
						storeInteger: 0
						ofObject: _gsSqueakTemp_rcvr
						withValue: _gsSqueakTemp_scanDestX.
					self
						storeInteger: 1
						ofObject: _gsSqueakTemp_rcvr
						withValue: _gsSqueakTemp_scanLastIndex.
					self
						pop: 7
						thenPush: (objectMemory fetchPointer: CrossedX - 1 ofObject: _gsSqueakTemp_stops).
					"args+rcvr"
					^ nil].
			_gsSqueakTemp_scanDestX := _gsSqueakTemp_nextDestX + _gsSqueakTemp_kernDelta.
			_gsSqueakTemp_scanLastIndex := _gsSqueakTemp_scanLastIndex + 1].
	(objectMemory isIntegerValue: _gsSqueakTemp_scanDestX)
		ifFalse: [^ self primitiveFail].
	self
		storeInteger: 0
		ofObject: _gsSqueakTemp_rcvr
		withValue: _gsSqueakTemp_scanDestX.
	self
		storeInteger: 1
		ofObject: _gsSqueakTemp_rcvr
		withValue: _gsSqueakTemp_scanStopIndex.
	self
		pop: 7
		thenPush: (objectMemory fetchPointer: EndOfRun - 1 ofObject: _gsSqueakTemp_stops)
	"args+rcvr"