testing
staysUpWhenMouseIsDownIn: aMorph
	^ ((aMorph == self target) or: [aMorph hasOwner: self])