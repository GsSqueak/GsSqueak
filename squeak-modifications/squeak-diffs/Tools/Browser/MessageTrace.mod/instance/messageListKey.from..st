message list
messageListKey: aChar from: view 
	aChar == $I ifTrue: [ ^ self invertLevelSelection ].
	^ super messageListKey: aChar from: view