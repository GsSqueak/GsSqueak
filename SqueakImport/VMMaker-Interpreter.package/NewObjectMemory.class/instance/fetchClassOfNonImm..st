object access
fetchClassOfNonImm: oop 
	| ccIndex |
	<inline: true>
	^(ccIndex := (self compactClassIndexOf: oop)) = 0
		ifTrue: [(self classHeader: oop) bitAnd: self allButTypeMask]
		ifFalse: [self compactClassAt: ccIndex]