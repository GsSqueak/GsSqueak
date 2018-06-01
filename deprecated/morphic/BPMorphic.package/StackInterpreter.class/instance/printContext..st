debug printing
printContext: aContext 
	| _gsSqueakTemp_sender _gsSqueakTemp_ip _gsSqueakTemp_sp |
	self shortPrintContext: aContext.
	_gsSqueakTemp_sender := objectMemory fetchPointer: SenderIndex ofObject: aContext.
	_gsSqueakTemp_ip := objectMemory fetchPointer: InstructionPointerIndex ofObject: aContext.
	(objectMemory isIntegerObject: _gsSqueakTemp_sender)
		ifTrue: [(self checkIsStillMarriedContext: aContext currentFP: framePointer)
				ifTrue: [self print: 'married (assuming framePointer valid)';
						 cr]
				ifFalse: [self print: 'widowed (assuming framePointer valid)';
						 cr].
			self print: 'sender   ';
				 printNum: _gsSqueakTemp_sender;
				 print: ' (';
				
				printHexPtr: (self withoutSmallIntegerTags: _gsSqueakTemp_sender);
				 printChar: $);
				 cr.
			self print: 'ip       ';
				 printNum: _gsSqueakTemp_ip;
				 print: ' (';
				
				printHexPtr: (self withoutSmallIntegerTags: _gsSqueakTemp_ip);
				 printChar: $);
				 cr]
		ifFalse: [self print: 'sender   ';
				 shortPrintOop: _gsSqueakTemp_sender.
			self print: 'ip       '.
			_gsSqueakTemp_ip = objectMemory nilObject
				ifTrue: [self shortPrintOop: _gsSqueakTemp_ip]
				ifFalse: [self printNum: _gsSqueakTemp_ip;
						 print: ' (';
						
						printNum: (objectMemory integerValueOf: _gsSqueakTemp_ip);
						 space;
						
						printHex: (objectMemory integerValueOf: _gsSqueakTemp_ip);
						 printChar: $);
						 cr]].
	_gsSqueakTemp_sp := objectMemory fetchPointer: StackPointerIndex ofObject: aContext.
	_gsSqueakTemp_sp := _gsSqueakTemp_sp min: (objectMemory lengthOf: aContext)
					- ReceiverIndex.
	self print: 'sp       ';
		 printNum: _gsSqueakTemp_sp;
		 print: ' (';
		
		printNum: (objectMemory integerValueOf: _gsSqueakTemp_sp);
		 printChar: $);
		 cr.
	self print: 'method   ';
		 printMethodFieldForPrintContext: aContext.
	self print: 'closure  ';
		
		shortPrintOop: (objectMemory fetchPointer: ClosureIndex ofObject: aContext).
	self print: 'receiver ';
		
		shortPrintOop: (objectMemory fetchPointer: ReceiverIndex ofObject: aContext).
	_gsSqueakTemp_sp := objectMemory integerValueOf: _gsSqueakTemp_sp.
	1
		to: _gsSqueakTemp_sp
		do: [:i | self print: '       ';
				 printNum: i;
				 space;
				
				shortPrintOop: (objectMemory fetchPointer: ReceiverIndex + i ofObject: aContext)]