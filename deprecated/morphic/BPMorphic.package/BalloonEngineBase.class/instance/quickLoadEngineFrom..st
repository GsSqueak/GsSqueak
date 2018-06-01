loading state
quickLoadEngineFrom: engineOop 
	"Load the minimal required state from the engineOop, e.g., just the
	work buffer.
	Answer 0 on success or non-zero a failure code on failure"
	| _gsSqueakTemp_failCode |
	interpreterProxy failed
		ifTrue: [^ GEFAlreadyFailed].
	(interpreterProxy isImmediate: engineOop)
		ifTrue: [^ GEFEngineIsInteger].
	(interpreterProxy isPointers: engineOop)
		ifFalse: [^ GEFEngineIsWords].
	(interpreterProxy slotSizeOf: engineOop)
			< BEBalloonEngineSize
		ifTrue: [^ GEFEngineTooSmall].
	engine := engineOop.
	(_gsSqueakTemp_failCode := self
					loadWorkBufferFrom: (interpreterProxy fetchPointer: BEWorkBufferIndex ofObject: engineOop)) = 0
		ifFalse: [^ _gsSqueakTemp_failCode].
	self stopReasonPut: 0.
	objUsed := self objUsedGet.
	engineStopped := false.
	^ 0