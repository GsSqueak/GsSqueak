process primitives
primitiveWait
	| _gsSqueakTemp_sema _gsSqueakTemp_excessSignals _gsSqueakTemp_activeProc |
	_gsSqueakTemp_sema := self stackTop.
	"rcvr"
	_gsSqueakTemp_excessSignals := self fetchInteger: ExcessSignalsIndex ofObject: _gsSqueakTemp_sema.
	_gsSqueakTemp_excessSignals > 0
		ifTrue: [self
				storeInteger: ExcessSignalsIndex
				ofObject: _gsSqueakTemp_sema
				withValue: _gsSqueakTemp_excessSignals - 1]
		ifFalse: [_gsSqueakTemp_activeProc := self activeProcess.
			self addLastLink: _gsSqueakTemp_activeProc toList: _gsSqueakTemp_sema.
			self transferTo: self wakeHighestPriority]