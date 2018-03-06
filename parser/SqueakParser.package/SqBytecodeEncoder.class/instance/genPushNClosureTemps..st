bytecode generation
genPushNClosureTemps: numTemps 
	"To reduce the number of bytecodes required, the embedded
	block closure implementation uses explicit push nil instructions
	to create block-local temps. In bytecode sets supporting
	FullBlockClosure/CompiledBlock this isn't needed and the
	number of temps is derived from the block method header."
	numTemps
		timesRepeat: [self genPushSpecialLiteral: nil]