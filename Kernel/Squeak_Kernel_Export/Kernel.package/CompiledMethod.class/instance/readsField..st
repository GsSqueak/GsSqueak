scanning
readsField: varIndex 
	"Answer whether the receiver loads the instance variable indexed by the  argument."
	| varIndexCode scanner |
	varIndexCode := varIndex - 1.
	self isQuick ifTrue:
		[^self isReturnField and: [self returnField = varIndexCode]].
	scanner := InstructionStream on: self.
	^scanner scanFor:(self encoderClass instVarReadScanBlockFor: varIndexCode using: scanner)