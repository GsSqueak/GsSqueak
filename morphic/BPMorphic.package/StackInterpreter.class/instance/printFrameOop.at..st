debug printing
printFrameOop: name at: address 
	| _gsSqueakTemp_it |
	_gsSqueakTemp_it := stackPages longAt: address.
	self printHexPtr: address;
		 printChar: $:.
	1
		to: 12
				- (self strlen: name)
		do: [:i | self printChar: $ ].
	self print: name;
		 print: ': ';
		 printHex: _gsSqueakTemp_it;
		 tab;
		 printChar: $=;
		 printOopShort: _gsSqueakTemp_it;
		 cr