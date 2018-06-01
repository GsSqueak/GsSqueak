compiled method support
instVarWriteScanBlockFor: varIndexCode using: scanner 
	"Answer a block argument for InstructionStream>>scanFor: that
	answers true
	for writes of the inst var with zero-relative index varIndexCode.
	N.B. Don't assume the compiler uses the most compact encoding
	available."
	self subclassResponsibility