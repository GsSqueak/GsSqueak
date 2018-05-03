become
restoreHeaderOf: oop 
	"Restore the original header of the given oop from its 
	forwarding block."
	| fwdHeader fwdBlock |
	fwdHeader := self longAt: oop.
	fwdBlock := (fwdHeader bitAnd: self allButMarkBitAndTypeMask) << 1.
	DoAssertionChecks
		ifTrue: [(fwdHeader bitAnd: self markBit) = 0
				ifTrue: [self error: 'attempting to restore the header of an object that has no forwarding block'].
			self fwdBlockValidate: fwdBlock].
	self longAt: oop put: (self longAt: fwdBlock + self bytesPerWord)