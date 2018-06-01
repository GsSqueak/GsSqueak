event handling
mouseMove: evt 
	(#(#buttonUp #whilePressed ) includes: actWhen)
		ifTrue: [(self containsPoint: evt cursorPoint)
				ifTrue: [self state: #pressed]
				ifFalse: [self state: #off]].
	super mouseMove: evt