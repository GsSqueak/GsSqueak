scanning
writesField: varIndex
	"Answer whether the receiver stores into the instance variable indexed
	 by the argument."

	| scanner |
	self isQuick ifTrue: [^false].
	scanner := InstructionStream on: self.
	^scanner scanFor: (self encoderClass instVarWriteScanBlockFor: varIndex - 1 using: scanner)