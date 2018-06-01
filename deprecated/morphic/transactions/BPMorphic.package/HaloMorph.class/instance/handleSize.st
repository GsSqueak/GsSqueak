private
handleSize
	^ Preferences biggerHandles
		ifTrue: [20]
		ifFalse: [16]