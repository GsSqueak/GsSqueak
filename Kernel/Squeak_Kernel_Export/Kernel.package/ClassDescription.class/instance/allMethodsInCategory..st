accessing method dictionary
allMethodsInCategory: aName 
	"Answer a list of all the method categories of the receiver and all its 
	superclasses "
	| aColl |
	aColl := OrderedCollection new.
	self withAllSuperclasses
		do: [:aClass | aColl
				addAll: (aName = ClassOrganizer allCategory
						ifTrue: [aClass organization allMethodSelectors]
						ifFalse: [aClass organization listAtCategoryNamed: aName])].
	^ aColl asSet asSortedArray

	"TileMorph allMethodsInCategory: #initialization"