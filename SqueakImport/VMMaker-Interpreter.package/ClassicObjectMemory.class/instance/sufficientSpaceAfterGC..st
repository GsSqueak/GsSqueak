allocation
sufficientSpaceAfterGC: minFree 
	"Return true if there is enough free space after doing a garbage collection. If not, signal that space is low."
	| growSize minFreePlus oldLimit |
	<inline: false>
	<var: #minFree type: 'usqInt'>
	<var: #growSize type: 'usqInt'>
	<var: #minFreePlus type: 'usqInt'>

	self incrementalGC. "try to recover some space"

	(self oop: (self sizeOfFree: freeBlock) isLessThan: minFree)
		ifTrue: [signalLowSpace ifTrue: [^false]. "give up; problem is already noted"
			self fullGC. "try harder"
			"for stability, require more free space after doing an expensive full GC"
			minFreePlus := minFree + 15000.
			minFreePlus < minFree
				ifTrue: [^ false "arithmetic overflow"].
			(self oop: (self sizeOfFree: freeBlock) isGreaterThanOrEqualTo: minFreePlus)
				ifTrue: [^ true].

			"still not enough; attempt to grow object memory"
			[oldLimit := memoryLimit.
			growSize := minFree - (self sizeOfFree: freeBlock) + growHeadroom.
			self growObjectMemory: growSize.
			(self oop: (self sizeOfFree: freeBlock) isGreaterThanOrEqualTo: minFreePlus)]
				whileFalse: "If the memoryLimit doesn't change then presumably the platform can't grow anymore." 
					[oldLimit = memoryLimit ifTrue: [^false]]].
	^true