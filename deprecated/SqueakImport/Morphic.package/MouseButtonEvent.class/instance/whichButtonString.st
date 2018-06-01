printing
whichButtonString
	"Return a string identifying the changed buttons"
	
	^ String streamContents: [:stream |
		stream nextPutAll: '( '.
		self redButtonChanged ifTrue: [stream nextPutAll: 'red '].
		self yellowButtonChanged ifTrue: [stream nextPutAll: 'yellow '].
		self blueButtonChanged ifTrue: [stream nextPutAll: 'blue '].
		stream nextPutAll: ')']