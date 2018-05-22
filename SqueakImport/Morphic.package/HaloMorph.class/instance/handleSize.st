private
handleSize
	^ Preferences biggerHandles
		ifTrue: [30]
		ifFalse: [16]