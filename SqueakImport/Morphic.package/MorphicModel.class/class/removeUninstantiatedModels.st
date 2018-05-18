housekeeping
removeUninstantiatedModels
	"With the user's permission, remove the classes of any models that have neither instances nor subclasses."
	"MorphicModel removeUninstantiatedModels"

	| candidatesForRemoval |
	Smalltalk garbageCollect.
	candidatesForRemoval :=
		MorphicModel subclasses select: [:c |
			(c instanceCount = 0) and: [c subclasses size = 0]].
	candidatesForRemoval do: [:c | | ok |
		ok := self confirm: 'Are you certain that you
want to delete the class ', c name, '?'.
		ok ifTrue: [c removeFromSystem]].
