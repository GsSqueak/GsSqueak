compiled method support
bindingReadScanBlockFor: litVarIndex using: scanner 
	"Answer a block argument for InstructionStream>>scanFor: that
	answers true
	for reads of the value of the binding with zero-relative index
	litVarIndex. N.B. Don't assume the compiler uses the most compact
	encoding available."
	self subclassResponsibility