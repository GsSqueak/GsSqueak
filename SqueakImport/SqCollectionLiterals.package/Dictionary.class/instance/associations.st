accessing
associations
	"Answer a Collection containing the receiver's associations."
	
	^Array new: self size streamContents: [ :stream |
		self associationsDo: [ :each | stream nextPut: each ] ]