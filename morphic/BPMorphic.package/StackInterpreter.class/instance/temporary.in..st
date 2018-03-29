internal interpreter access
temporary: offset in: theFP 
	"See StackInterpreter class>>initializeFrameIndices"
	| _gsSqueakTemp_frameNumArgs |
	^ offset < (_gsSqueakTemp_frameNumArgs := self frameNumArgs: theFP)
		ifTrue: [stackPages longAt: theFP + FoxCallerSavedIP + (_gsSqueakTemp_frameNumArgs - offset * objectMemory wordSize)]
		ifFalse: [stackPages longAt: theFP + FoxReceiver - objectMemory wordSize + (_gsSqueakTemp_frameNumArgs - offset * objectMemory wordSize)]