printing
wheelString
	"Return a string identifying the wheel state"
	
	^ String streamContents: [:stream |
		self isWheelUp ifTrue: [stream nextPutAll: 'up '].
		self isWheelDown ifTrue: [stream nextPutAll: 'down '].
		self isWheelLeft ifTrue: [stream nextPutAll: 'left '].
		self isWheelRight ifTrue: [stream nextPutAll: 'right ']]