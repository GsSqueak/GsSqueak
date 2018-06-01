accessing
flushAllButDandDEvents
	| newQueue oldQueue  |
	
	newQueue := SharedQueue new.
	self eventQueue ifNil: [ 
		self eventQueue: newQueue.
		^ self].
	oldQueue := self eventQueue.
	[oldQueue size > 0] whileTrue: 
		[| item type | 
		item := oldQueue next.
		type := item at: 1.
		type = EventTypeDragDropFiles ifTrue: [ newQueue nextPut: item]].
	self eventQueue: newQueue.