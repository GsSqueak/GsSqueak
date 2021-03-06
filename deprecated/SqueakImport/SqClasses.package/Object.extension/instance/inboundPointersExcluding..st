*SqClasses-tracing
inboundPointersExcluding: objectsToExclude
	"Answer a list of all objects in the system that hold a reference to me, excluding those in the collection of objectsToExclude."

	| pointers object objectsToAlwaysExclude |
	Smalltalk garbageCollect.
	pointers := OrderedCollection new.
	self systemNavigation allObjectsOrNil ifNotNil: [ :allObjects |
		objectsToAlwaysExclude := {
			allObjects.
			thisContext.
			thisContext sender.
			thisContext sender sender.
			objectsToExclude.
		}.
		1 to: allObjects size do: [ :index |
			object := allObjects at: index.
			(object pointsTo: self) ifTrue: [
				((objectsToAlwaysExclude identityIncludes: object)
					or: [ objectsToExclude identityIncludes: object ])
					ifFalse: [ pointers add: object ] ] ].
		^pointers ].
	"SystemNavigation >> #allObjectsDo: is inlined here with a slight modification: the marker object is pointers. This gives better results, because the value of pointers, it's inner objects and transient method contexts will not be iterated over."
	object := self someObject.
	[ object == pointers ] whileFalse: [
		(object isInMemory and: [ object pointsTo: self ]) ifTrue: [
			pointers add: object ].
		object := object nextObject ].
	objectsToAlwaysExclude := {
		thisContext.
		thisContext sender.
		thisContext sender sender.
		objectsToExclude.
	}.
	^pointers removeAllSuchThat: [ :ea |
		(objectsToAlwaysExclude identityIncludes: ea)
			or: [ objectsToExclude identityIncludes: ea ] ]
