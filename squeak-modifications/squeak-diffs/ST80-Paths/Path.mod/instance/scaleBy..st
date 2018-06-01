transforming
scaleBy: aPoint 
	"Answers a new Path scaled by aPoint. Does not affect the current data in 
	this Path."

	| newPath | 
	newPath := self species new: self size. 
	newPath form: self form.
	collectionOfPoints do: [:element | newPath add: (element scaleBy: aPoint)].
	^newPath