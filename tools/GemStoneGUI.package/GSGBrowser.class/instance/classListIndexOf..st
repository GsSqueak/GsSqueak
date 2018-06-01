class list
classListIndexOf: className 

	| classList |
	classList := self classList.
	classList := classList collect: [:ea | ea withoutLeadingBlanks asSymbol].
	^ classList indexOf: className.