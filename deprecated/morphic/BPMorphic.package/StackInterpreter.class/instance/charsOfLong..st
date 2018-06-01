debug support
charsOfLong: long 
	"N.B. This will need to be overridden in big-endian simulator
	subclasses. "
	^ (1 to: objectMemory wordSize)
		collect: [:i | | d | (d := long digitAt: i) >= 14
				ifTrue: [d asCharacter]
				ifFalse: [$?]]