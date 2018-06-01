encoding
litIndex: literal 
	| p |
	p := literalStream position.
	p = self maxNumLiterals
		ifTrue: [self notify: 'More than ' , self maxNumLiterals printString , ' literals referenced.\You must split or otherwise simplify this method.\The ' withCRs , (self maxNumLiterals + 1) printString , 'th literal is: ' , literal printString.
			^ nil].
	"Would like to show where it is in the source code, 
	but that info is hard to get."
	literalStream nextPut: literal.
	^ p