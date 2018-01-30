scanning
writesRef: variableBinding 
	"Answer whether the receiver writes the value of the argument."
	"eem 5/24/2008 Rewritten to no longer assume the compler uses the
	 most compact encoding available (for EncoderForLongFormV3 support)."
	| litIndex scanner |
	(litIndex := self indexOfLiteral: variableBinding) = 0 ifTrue:
		[^false].
	scanner := InstructionStream on: self.
	^scanner scanFor: (self encoderClass bindingWriteScanBlockFor: litIndex - 1 using: scanner)