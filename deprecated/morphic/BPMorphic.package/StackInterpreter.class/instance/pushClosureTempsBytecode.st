stack bytecodes
pushClosureTempsBytecode
	"SistaV1:	230		11100110	iiiiiiii		PushNClosureTemps iiiiiiii"
	| _gsSqueakTemp_nTemps |
	_gsSqueakTemp_nTemps := self fetchByte.
	self fetchNextBytecode.
	1
		to: _gsSqueakTemp_nTemps
		do: [:i | self internalPush: objectMemory nilObject]