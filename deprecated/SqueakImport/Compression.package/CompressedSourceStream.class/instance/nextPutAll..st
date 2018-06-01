access
nextPutAll: str
	| n nInSeg |
	n := str size.
	n <= (writeLimit - position) ifTrue:
		["All characters fit in buffer"
		collection replaceFrom: position + 1 to: position + n with: str.
		dirty := true.
		position := position + n.
		readLimit := readLimit max: position.
		endOfFile := endOfFile max: self position.
		^ str].

	"Write what fits in segment.  Then (after positioning) write what remains"
	nInSeg := writeLimit - position.
	nInSeg = 0
		ifTrue: [self position: self position.
				self nextPutAll: str]
		ifFalse: [self nextPutAll: (str first: nInSeg).
				self position: self position.
				self nextPutAll: (str allButFirst: nInSeg)].
	^str
	
