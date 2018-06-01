*SqClasses-*SqClasses-*SqClasses-miscellaneous
hasMorphic
	"Answer whether the Morphic classes are available in the
	system (they may have been stripped, such as by a call to
	Smalltalk removeMorphic"
	^ (self
		at: #Morph
		ifAbsent: [])
		isKindOf: Class
