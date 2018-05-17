query
allStoresInto: varName from: aClass 
	"Answer a sequence of MewthodReferences for all the receiver's methods 
	 or any methods of a subclass/superclass that assign to the instance variable name."
	"self new allStoresInto: 'contents' from: Collection."
	| result roots |
	result := OrderedCollection new.
	(aClass theNonMetaClass inheritsFrom: SharedPool) ifTrue:
		[roots := self allClasses select: [:class| class sharedPools includes: aClass theNonMetaClass].
		  roots do:
			[:root|
			 root withAllSubclassesDo:
				[:class|
				 (class whichMethodsStoreInto: varName), 
				 (class class whichMethodsStoreInto: varName) do:
					[:eachMethod|
					 result add: eachMethod methodReference]]]].
	aClass withAllSubAndSuperclassesDo:
		[ : class |
		(class theNonMetaClass whichMethodsStoreInto: varName),
		(class theMetaClass whichMethodsStoreInto: varName) do:
			[ : eachMethod |
			result add: eachMethod methodReference ] ].
	^result