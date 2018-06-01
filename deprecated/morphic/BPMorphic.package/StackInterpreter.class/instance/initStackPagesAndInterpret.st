initialization
initStackPagesAndInterpret
	"Initialize the stack pages and enter interpret. Use alloca'ed memory so
	that when
	we have a JIT its stack pointer will be on the native stack since alloca
	allocates memory on the stack. Certain thread systems use the native
	stack pointer as the
	frame ID so putting the stack anywhere else can confuse the thread
	system. "
	"This should be in its own initStackPages method but Slang can't inline
	C code strings."
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
		pageSize: _gsSqueakTemp_stackPageBytes / objectMemory wordSize.
	"Once the stack pages are initialized we can continue to bootstrap the
	system. "
	self loadInitialContext.
	"We're ready for the heartbeat (poll interrupt)"
	self ioInitHeartbeat.
	self interpret.
	^ nil