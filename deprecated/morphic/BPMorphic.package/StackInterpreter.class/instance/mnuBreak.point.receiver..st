debug support
mnuBreak: selectorString point: selectorLength receiver: receiverOrNil 
	"C version is in platforms/Cross/vm/dispdbg.h"
	"self shortPrintFrameAndCallers: localFP"
	| _gsSqueakTemp_i |
	breakSelectorLength negated = selectorLength
		ifTrue: [_gsSqueakTemp_i := breakSelectorLength negated.
			[_gsSqueakTemp_i > 0]
				whileTrue: [(objectMemory byteAt: selectorString + _gsSqueakTemp_i - 1)
							= (breakSelector at: _gsSqueakTemp_i) asInteger
						ifTrue: [(_gsSqueakTemp_i := _gsSqueakTemp_i - 1) = 0
								ifTrue: [self changed: #byteCountText.
									self halt: 'MNU of ' , breakSelector
											, (receiverOrNil
													ifNil: ['']
													ifNotNil: [' to '
															, (self shortPrint: receiverOrNil)])]]
						ifFalse: [_gsSqueakTemp_i := 0]]]