class hierarchy
subclasses
	"Return all the subclasses of nil"
	| classList |
	classList := WriteStream on: Array new.
	self subclassesDo:[:class| classList nextPut: class].
	^classList contents