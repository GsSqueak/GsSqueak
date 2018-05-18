adding
member: newObject
	"Include newObject as one of the receiver's elements, if already exists just return it"

	| index |
	index := self scanFor: (keyBlock value: newObject).
	(array at: index) ifNotNil: [ :element | ^element enclosedSetElement].
	self atNewIndex: index put: newObject asSetElement.
	^ newObject