query
allUnusedClassesWithout: classesAndMessagesPair 
	"Enumerates all classes in the system and returns a list of those that are 
	apparently unused. A class is considered in use if it (a) has subclasses  
	or (b) is referred to by some method or (c) has its name in use as a  
	literal."
	"SystemNavigation new unusedClasses"

	| unused |
	unused := self environment classNames asIdentitySet
				copyWithoutAll: (self allGlobalRefsWithout: classesAndMessagesPair).
	^ unused
		reject: [:cName | | cl | 
			cl := self environment at: cName.
			cl subclasses isEmpty not
				or: [cl inheritsFrom: FileDirectory]]