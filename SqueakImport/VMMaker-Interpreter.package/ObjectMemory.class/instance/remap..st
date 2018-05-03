gc -- compaction
remap: oop 
	"Map the given oop to its new value during a compaction or 
	become: operation. If it has no forwarding table entry, 
	return the oop itself."
	| fwdBlock |
	<inline: false>
	(self isObjectForwarded: oop)
		ifTrue: ["get the new value for oop from its forwarding block"
			fwdBlock := ((self longAt: oop) bitAnd: self allButMarkBitAndTypeMask) << 1.
			DoAssertionChecks
				ifTrue: [self fwdBlockValidate: fwdBlock].
			^ self longAt: fwdBlock].
	^ oop