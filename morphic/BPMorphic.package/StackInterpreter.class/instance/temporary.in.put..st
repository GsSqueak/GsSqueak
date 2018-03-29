internal interpreter access
temporary: offset in: theFP put: valueOop 
	"See StackInterpreter class>>initializeFrameIndices"
	| _gsSqueakTemp_frameNumArgs |
	^ offset < (_gsSqueakTemp_frameNumArgs := self frameNumArgs: theFP)
		ifTrue: [stackPages longAt: theFP + FoxCallerSavedIP + (_gsSqueakTemp_frameNumArgs - offset * objectMemory wordSize) put: valueOop]
		ifFalse: [stackPages longAt: theFP + FoxReceiver - objectMemory wordSize + (_gsSqueakTemp_frameNumArgs - offset * objectMemory wordSize) put: valueOop]