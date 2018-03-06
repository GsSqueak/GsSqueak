compiled method support
superSendScanBlockUsing: scanner 
	"Answer a block argument for InstructionStream>>scanFor:
	that answers true for super sends."
	^ [:instr | instr = 133
		or: [instr = 132
				and: [scanner followingByte between: 32 and: 63]]]