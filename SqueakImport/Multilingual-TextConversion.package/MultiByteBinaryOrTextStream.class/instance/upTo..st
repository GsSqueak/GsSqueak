public
upTo: delim 

	| out ch |
	out := WriteStream on: (String new: 1000).
	self atEnd ifTrue: [^ ''].
	[(ch := self next) == nil] whileFalse: [
		(ch = delim) ifTrue: [
			^ out contents  "terminator is not doubled; we're done!"
		].
		out nextPut: ch.
	].
	^ out contents.
