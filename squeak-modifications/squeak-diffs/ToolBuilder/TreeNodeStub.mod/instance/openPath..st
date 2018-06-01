events
openPath: anArray
	| child |
	anArray isEmpty 
		ifTrue: [self select]
		ifFalse: [child := self children 
								detect: [:ea | ea matches: anArray first] 
								ifNone: [^ self select].
				child openPath: anArray allButFirst]
	