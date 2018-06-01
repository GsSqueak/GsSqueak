C library simulation
mem: destAddress mo: sourceAddress ve: bytes 
	| _gsSqueakTemp_dst _gsSqueakTemp_src |
	_gsSqueakTemp_dst := destAddress asInteger.
	_gsSqueakTemp_src := sourceAddress asInteger.
	"Emulate the c library memmove function"
	self assert: bytes \\ 4 = 0.
	destAddress > sourceAddress
		ifTrue: [bytes - 4
				to: 0
				by: -4
				do: [:i | self
						longAt: _gsSqueakTemp_dst + i
						put: (self longAt: _gsSqueakTemp_src + i)]]
		ifFalse: [0
				to: bytes - 4
				by: 4
				do: [:i | self
						longAt: _gsSqueakTemp_dst + i
						put: (self longAt: _gsSqueakTemp_src + i)]]