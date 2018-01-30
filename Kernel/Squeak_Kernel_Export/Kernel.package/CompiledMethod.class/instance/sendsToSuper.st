scanning
sendsToSuper
	"Answer whether the receiver sends any message to super."
	| scanner |
	scanner := InstructionStream on: self.
	^scanner scanFor: (self encoderClass superSendScanBlockUsing: scanner)