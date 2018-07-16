private
getString: singleOop
	^ self ws extSession send: 'printString' to: singleOop
