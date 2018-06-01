debug printing
printFrameThing: name at: address 
	| _gsSqueakTemp_it _gsSqueakTemp_len |
	_gsSqueakTemp_it := stackPages longAt: address.
	self printHexPtr: address;
		 printChar: $:.
	_gsSqueakTemp_len := self strlen: name.
	1
		to: 12 - _gsSqueakTemp_len
		do: [:i | self space].
	self print: name;
		 print: ': ';
		 printHex: _gsSqueakTemp_it.
	_gsSqueakTemp_it ~= 0
		ifTrue: [self printChar: $=.
			_gsSqueakTemp_it = objectMemory nilObject
				ifTrue: [self print: 'nil']
				ifFalse: [self printNum: _gsSqueakTemp_it]].
	self cr