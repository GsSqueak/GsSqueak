class list
selectedClassOrMetaClass
	"Answer the currently selected class (or metaclass)."
	self hasMessageSelected ifTrue:
		[ ^ self setClassAndSelectorIn: [:c :s | ^c] ].
	
	(selectorListIndex isNil not and: [selectorListIndex > 0]) ifTrue: [^Smalltalk classNamed: (self selectorList at: selectorListIndex)].
	
	^ nil.
	