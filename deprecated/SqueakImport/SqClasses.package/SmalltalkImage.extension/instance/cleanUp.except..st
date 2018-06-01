*SqClasses-*SqClasses-*SqClasses-housekeeping
cleanUp: aggressive except: exclusions 
	"Clean up. When aggressive is true, this will destroy projects, change sets, etc.
	Leave out any classes specifically listed in exclusions."
	"Smalltalk cleanUp: true except: {Project. ChangeSet}"
	"Find all classes implementing #cleanUp or cleanUp:"
	| classes |
	classes := Smalltalk allClasses select:
		[ : eachClass | (eachClass class includesSelector: #cleanUp) or:
			[ (eachClass class includesSelector: #cleanUp:) and: [ (exclusions includes: eachClass) not ] ] ].
	"Arrange classes in superclass order, superclasses before subclasses, so that specific cleanup (like MethodDictionary compaction) will run after generic superclass cleanup (HashedCollection rehashing). Otherwise generic superclass cleanup might undo specific one (in this case rehashing will undo a good bit of MD compaction)."
	(ChangeSet superclassOrder: classes)
		do: [ : aClass | aClass cleanUp: aggressive ]
		displayingProgress: [ : aClass | 'Cleaning up in ' , aClass name ]
