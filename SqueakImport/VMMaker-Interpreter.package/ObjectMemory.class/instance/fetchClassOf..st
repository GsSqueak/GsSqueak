interpreter access
fetchClassOf: oop 
	| ccIndex |
	<inline: true>
	(self isIntegerObject: oop) ifTrue: [^ self splObj: ClassInteger].

	ccIndex := (self baseHeader: oop) >> 12 bitAnd: 31.
	ccIndex = 0
		ifTrue: [^ (self classHeader: oop)
				bitAnd: self allButTypeMask]
		ifFalse: ["look up compact class"
			^ self fetchPointer: ccIndex - 1 ofObject: (self fetchPointer: CompactClasses ofObject: specialObjectsOop)]