private
addHandles
	simpleMode == true
		ifTrue:
			[self addSimpleHandles]
		ifFalse:
			[self addCircleHandles]
