transforming
translateBy: aPoint 
	"Answers a new Path whose elements are translated by aPoint. Does not
	affect the elements of this Path."

	| newPath |
	newPath := self species new: self size.
	newPath form: self form.
	collectionOfPoints do: [:element | newPath add: (element translateBy: aPoint)].
	^newPath