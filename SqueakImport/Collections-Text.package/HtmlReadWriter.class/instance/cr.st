stream emulation
cr

	self breakLines ifTrue: [stream nextPutAll: '<br>'].
	^ stream cr