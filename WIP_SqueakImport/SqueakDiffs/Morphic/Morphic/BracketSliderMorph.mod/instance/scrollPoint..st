event handling
scrollPoint: event
	"Scroll to the event position."
	
	| r p |
	r := self roomToMove.
	self orientation == #horizontal
		ifTrue: [r width = 0 ifTrue: [^ self]]
		ifFalse: [r height = 0 ifTrue: [^ self]].
	p := event position - (self sliderThickness // 2) adhereTo: r.
	self descending
		ifFalse:
			[self setValue: (self orientation == #horizontal 
				ifTrue: [(p x - r left) asFloat / r width]
				ifFalse: [(p y - r top) asFloat / r height])]
		ifTrue:
			[self setValue: (self orientation == #horizontal
				ifTrue: [(r right - p x) asFloat / r width]
				ifFalse:	[(r bottom - p y) asFloat / r height])]