initialization
initStackPages
	"Initialize the stackPages. This version is only for simulation
	because Slang refuses to inline it, which makes the alloca invalid."
	| _gsSqueakTemp_stackPageBytes _gsSqueakTemp_stackPagesBytes _gsSqueakTemp_theStackMemory |
	_gsSqueakTemp_stackPageBytes := self stackPageByteSize.
	_gsSqueakTemp_stackPagesBytes := self computeStackZoneSize.
	_gsSqueakTemp_theStackMemory := self
				cCode: [self alloca: _gsSqueakTemp_stackPagesBytes]
				inSmalltalk: [stackPages initializeWithByteSize: _gsSqueakTemp_stackPagesBytes for: self].
	self
		cCode: [self
				me: _gsSqueakTemp_theStackMemory
				ms: 0
				et: _gsSqueakTemp_stackPagesBytes].
	stackPages
		initializeStack: _gsSqueakTemp_theStackMemory
		numSlots: _gsSqueakTemp_stackPagesBytes / objectMemory wordSize
		pageSize: _gsSqueakTemp_stackPageBytes / objectMemory wordSize