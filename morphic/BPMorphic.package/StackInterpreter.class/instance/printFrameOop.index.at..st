debug printing
printFrameOop: name index: idx at: address 
	| _gsSqueakTemp_it |
	_gsSqueakTemp_it := stackPages longAt: address.
	self printHexPtr: address;
		 printChar: $:.
	1
		to: 11
				- (self strlen: name) - (self
					log10: (idx max: 1)) floor
		do: [:i | self printChar: $ ].
	self print: name;
		 printNum: idx;
		 print: ': ';
		 printHex: _gsSqueakTemp_it;
		 tab;
		 printChar: $=;
		 printOopShort: _gsSqueakTemp_it;
		 cr