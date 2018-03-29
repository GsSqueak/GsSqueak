debug printing
printFrameFlagsForFP: theFP 
	| _gsSqueakTemp_address _gsSqueakTemp_it |
	_gsSqueakTemp_address := theFP + FoxFrameFlags.
	_gsSqueakTemp_it := stackPages longAt: _gsSqueakTemp_address.
	self printHexPtr: _gsSqueakTemp_address;
		 print: ':       flags: ';
		 printHex: _gsSqueakTemp_it.
	_gsSqueakTemp_it ~= 0
		ifTrue: [self printChar: $=;
				 printNum: _gsSqueakTemp_it].
	self print: '  numArgs: ';
		
		printNum: (self frameNumArgs: theFP);
		
		print: ((self frameHasContext: theFP)
				ifTrue: [' hasContext']
				ifFalse: [' noContext']);
		
		print: ((self frameIsBlockActivation: theFP)
				ifTrue: [' isBlock']
				ifFalse: [' notBlock']);
		 cr