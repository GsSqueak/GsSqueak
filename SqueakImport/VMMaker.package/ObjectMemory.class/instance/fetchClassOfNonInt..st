interpreter access
fetchClassOfNonInt: oop 
	| ccIndex |
	<inline: true>
	ccIndex := (self baseHeader: oop) >> 12 bitAnd: 31.
	ccIndex = 0
		ifTrue: [^ (self classHeader: oop)
				bitAnd: self allButTypeMask]
		ifFalse: ["look up compact class"
			^ self fetchPointer: ccIndex - 1 ofObject: (self fetchPointer: CompactClasses ofObject: specialObjectsOop)]