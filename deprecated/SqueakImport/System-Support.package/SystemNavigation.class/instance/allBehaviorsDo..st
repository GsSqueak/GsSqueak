query
allBehaviorsDo: aBlock 
	"Evaluate the argument, aBlock, for each kind of Behavior in the system 
	(that is, Object and its subclasses and Traits).
	ar 7/15/1999: The code below will not enumerate any obsolete or anonymous
	behaviors for which the following should be executed:

		Smalltalk allObjectsDo:[:obj| obj isBehavior ifTrue:[aBlock value: obj]].

	but what follows is way faster than enumerating all objects."

	self environment allClassesAndTraitsDo: [ :class |
		aBlock value: class.
		class isTrait ifFalse: [ "class of a Trait is Trait, there are no MetaTraits"
			aBlock value: class class ] ]