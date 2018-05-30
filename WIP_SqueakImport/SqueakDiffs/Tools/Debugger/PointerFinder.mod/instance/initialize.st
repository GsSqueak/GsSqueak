application
initialize
	parents := IdentityDictionary new: 20000.
	parents at: Smalltalk put: nil.
	parents at: Processor put: nil.
	parents at: self put: nil.

	toDo := OrderedCollection new: 5000.
	toDo add: Smalltalk.
	toDoNext := OrderedCollection new: 5000