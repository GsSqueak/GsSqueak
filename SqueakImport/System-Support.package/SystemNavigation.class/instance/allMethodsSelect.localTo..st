query
allMethodsSelect: aBlock localTo: aClass
	"Answer a SortedCollection of each methodr in, above, or below the given
	 class that, when used as the argument to aBlock, gives a true result."

	| aSet collectInSet |
	aSet := Set new.
	collectInSet := [:class |
		class selectorsAndMethodsDo:
			[:aSelector :aMethod|
			(aBlock value: aMethod) ifTrue:
				[aSet add: (MethodReference class: class selector: aSelector)]]].
	Cursor wait showWhile:
		[aClass theNonMetaClass
			withAllSuperAndSubclassesDoGently: collectInSet.
		aClass theNonMetaClass class
			withAllSuperAndSubclassesDoGently: collectInSet].
	^aSet