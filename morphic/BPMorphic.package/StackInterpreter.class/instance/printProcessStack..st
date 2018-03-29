debug printing
printProcessStack: aProcess 
	| _gsSqueakTemp_ctx |
	self cr;
		printNameOfClass: (objectMemory fetchClassOf: aProcess)
		count: 5; space; printHex: aProcess.
	self print: ' priority ';
		
		printNum: (self quickFetchInteger: PriorityIndex ofObject: aProcess);
		 cr.
	_gsSqueakTemp_ctx := objectMemory followField: SuspendedContextIndex ofObject: aProcess.
	_gsSqueakTemp_ctx = objectMemory nilObject
		ifFalse: [self printCallStackOf: _gsSqueakTemp_ctx currentFP: framePointer]