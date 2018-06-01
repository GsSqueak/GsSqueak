compiled method support
instVarReadScanBlockFor: varIndexCode using: scanner 
	"Answer a block argument for InstructionStream>>scanFor: that
	answers true
	for reads of the inst var with zero-relative index varIndexCode.
	N.B. Don't assume the compiler uses the most compact encoding
	available."
	self subclassResponsibility