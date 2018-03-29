translation
requiredMethodNames: options 
	"Answer the list of method names that should be retained for export or
	other support reasons"
	"A number of methods required by VM support code, specific
	platforms, etc"
	| _gsSqueakTemp_requiredList |
	_gsSqueakTemp_requiredList := #(#assertValidExecutionPointe:r:s: #characterForAscii: #findClassOfMethod:forReceiver: #findSelectorOfMethod: #forceInterruptCheck #forceInterruptCheckFromHeartbeat #fullDisplayUpdate #getCurrentBytecode #getFullScreenFlag #getInterruptKeycode #getInterruptPending #getSavedWindowSize #getThisSessionID #interpret #loadInitialContext #primitiveFail #primitiveFailFor: #primitiveFlushExternalPrimitives #printAllStacks #printCallStack #printContext: #printExternalHeadFrame #printFramesInPage: #printFrame: #printHeadFrame #printMemory #printOop: #printStackPages #printStackPageList #printStackPagesInUse #printStackPageListInUse #readableFormat: #readImageFromFile:HeapSize:StartingAt: #setFullScreenFlag: #setInterruptKeycode: #setInterruptPending: #setInterruptCheckChain: #setSavedWindowSize: #success: #validInstructionPointer:inMethod:framePointer:) asSet.
	"Nice to actually have all the primitives available"
	_gsSqueakTemp_requiredList
		addAll: (self primitiveTable
				select: [:each | each isSymbol]).
	"InterpreterProxy is the internal analogue of sqVirtualMachine.c, so
	make sure to keep all those"
	InterpreterProxy organization categories
		do: [:cat | (cat ~= 'initialize'
					and: [cat ~= 'private'])
				ifTrue: [_gsSqueakTemp_requiredList
						addAll: (InterpreterProxy organization listAtCategoryNamed: cat)]].
	^ _gsSqueakTemp_requiredList