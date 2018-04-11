*SqClasses-accessing method dictionary
allMethodsInCategory: aName 
	"Answer a list of all the method categories of the receiver and all its 
	superclasses "
	| set |
	set := Set new.
	self withAllSuperclassesDo: [:aClass |
		set	addAll: (
			aName = ClassOrganizer allCategory
					ifTrue: [aClass organization allMethodSelectors]
					ifFalse: [aClass organization listAtCategoryNamed: aName])].
	^set sorted

	"TileMorph allMethodsInCategory: #initialization"
