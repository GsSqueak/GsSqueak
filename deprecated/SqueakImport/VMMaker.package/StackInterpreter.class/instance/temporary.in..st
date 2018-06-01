internal interpreter access
temporary: offset in: theFP
	"See StackInterpreter class>>initializeFrameIndices"
	| frameNumArgs |
	<inline: true>
	<var: #theFP type: #'char *'>
	^offset < (frameNumArgs := self frameNumArgs: theFP)
		ifTrue: [stackPages longAt: theFP + FoxCallerSavedIP + ((frameNumArgs - offset) * objectMemory bytesPerWord)]
		ifFalse: [stackPages longAt: theFP + FoxReceiver - self bytesPerWord + ((frameNumArgs - offset) * self bytesPerWord)]