UI
utilitiesMenu: aMenuMorph
	aMenuMorph
		add: 'toggle transcript' action: #toggleTranscript;
		addLine;
		add: 'print ext head frame' action: #printExternalHeadFrame;
		add: 'print int head frame' action: #printHeadFrame;
		add: 'short print frame & callers' action: [self shortPrintFrameAndCallers: framePointer];
		add: 'long print frame & callers' action: [self printFrameAndCallers: framePointer SP: stackPointer];
		add: 'print frame...' target: self action: [(self promptHex: 'print frame') ifNotNil: [:fp| self printFrame: fp]];
		add: 'print call stack' action: #printCallStack;
		add: 'print oop...' action: [(self promptHex: 'print oop') ifNotNil: [:oop| self printOop: oop]];
		addLine;
		add: 'inspect object memory' target: objectMemory action: #inspect;
		add: 'inspect cointerpreter' action: #inspect;
		addLine;
		add: 'set break count...' action: #setBreakCount;
		add: (printSends
				ifTrue: ['no print sends']
				ifFalse: ['print sends'])
			action: [self ensureDebugAtEachStepBlock.
					printSends := printSends not];
		"currently printReturns does nothing"
		"add: (printReturns
				ifTrue: ['no print returns']
				ifFalse: ['print returns'])
			action: [self ensureDebugAtEachStepBlock.
					printReturns := printReturns not];"
		add: (printBytecodeAtEachStep
				ifTrue: ['no print bytecode each bytecode']
				ifFalse: ['print bytecode each bytecode'])
			action: [self ensureDebugAtEachStepBlock.
					printBytecodeAtEachStep := printBytecodeAtEachStep not];
		add: (printFrameAtEachStep
				ifTrue: ['no print frame each bytecode']
				ifFalse: ['print frame each bytecode'])
			action: [self ensureDebugAtEachStepBlock.
					printFrameAtEachStep := printFrameAtEachStep not].
	^aMenuMorph