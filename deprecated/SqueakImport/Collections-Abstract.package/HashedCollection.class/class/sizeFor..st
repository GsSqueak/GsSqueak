sizing
sizeFor: nElements
	"Large enough prime (or odd if too large) size to hold nElements with some slop (see fullCheck)"
	
	nElements < 4 ifTrue: [ ^5 ].
	^self goodPrimeAtLeast: nElements + 1 * 4 // 3