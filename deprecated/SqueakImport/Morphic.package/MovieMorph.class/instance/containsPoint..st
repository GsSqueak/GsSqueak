geometry testing
containsPoint: p 
	| frame |
	frame := self currentFrame.
	^ (frame notNil and: [playMode = #stop]) 
		ifTrue: [frame containsPoint: p]
		ifFalse: [super containsPoint: p]