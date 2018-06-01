model access
copyright
	| f |
	f := self selectedFont ifNil:[^ ''].
	^ f isTTCFont
		ifTrue: [f ttcDescription copyright ifNil: ['']]
		ifFalse: ['']