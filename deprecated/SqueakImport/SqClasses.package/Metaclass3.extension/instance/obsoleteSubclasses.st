*SqClasses-class hierarchy
obsoleteSubclasses
	"Answer the receiver's subclasses."
	destClass == nil ifTrue:[^#()].
	^destClass obsoleteSubclasses 
		select:[:aSubclass| aSubclass isMeta not] 
		thenCollect:[:aSubclass| aSubclass class]

	"Metaclass allInstancesDo:
		[:m | Compiler evaluate: 'subclasses:=nil' for: m logged: false]"
