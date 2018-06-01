access
next: n
	| str |
	n <= (readLimit - position) ifTrue:
		["All characters are available in buffer"
		str := collection copyFrom: position + 1 to: position + n.
		position := position + n.
		^ str].

	"Read limit could be segment boundary or real end of file"
	(readLimit + self segmentOffset) = endOfFile ifTrue:
		["Real end of file -- just return what's available"
		^ self next: readLimit - position].

	"Read rest of segment.  Then (after positioning) read what remains"
	str := self next: readLimit - position.
	self position: self position.
	^ str , (self next: n - str size)
