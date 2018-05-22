read write
instVarInfo: anObject
	"Return the object to write on the outgoing file that contains the structure of each class we are about to write out.  Must be an Array whose first element is 'class structure'.  Its second element is a Dictionary of pairs of the form #Rectangle -> #(<classVersion> 'origin' 'corner').  "

	"Make a pass through the objects, not writing, but recording the classes.  Construct a database of their inst vars and any version info (classVersion)."

	| dummy refs cls newSupers |
	structures := Dictionary new.
	superclasses := Dictionary new.
	dummy := ReferenceStream on: (DummyStream on: nil).
		"Write to a fake Stream, not a file"
	"Collect all objects"
	dummy rootObject: anObject.	"inform him about the root"
	dummy nextPut: anObject.
	refs := dummy references.
	objCount := refs size.		"for progress bar"
		"Note that Dictionary must not change its implementation!  If it does, how do we read this reading information?"
	(refs includesKey: #AnImageSegment) 
		ifFalse: [
			self uniClassInstVarsRefs: dummy.	"catalog the extra objects in UniClass inst vars"
			refs keysDo: [:each | 
				cls := each class.
				"cls isObsolete ifTrue: [self error: 'Trying to write ', cls name]."
				(cls class ~~ Metaclass) & (cls isObsolete not) ifTrue: [
					structures at: cls name put: false]]]
		ifTrue: [self recordImageSegment: refs].
	"Save work by only computing inst vars once for each class"
	newSupers := Set new.
	structures at: #Point put: false.	"writeRectangle: does not put out class pointer"
	structures at: #Rectangle put: false.
	structures at: #LargePositiveInteger put: false.	"used in slow case of WordArray"
	structures keysDo: [:nm | 
		cls := (nm endsWith: ' class') 
			ifFalse: [Smalltalk at: nm]
			ifTrue: [(Smalltalk at: nm substrings first asSymbol) class].
		cls allSuperclasses do: [:aSuper |
			structures at: aSuper name ifAbsent: [newSupers add: aSuper name]]].
			"Don't modify structures during iteration"
	newSupers do: [:nm | structures at: nm put: 3].	"Get all superclasses into list"
	structures keysDo: [:nm | "Nothing added to classes during loop"
		cls := (nm endsWith: ' class') 
			ifFalse: [Smalltalk at: nm]
			ifTrue: [(Smalltalk at: nm substrings first asSymbol) class].
		structures at: nm put: 
			((Array with: cls classVersion), (cls allInstVarNames)).
		superclasses at: nm ifAbsentPut: [cls superclass name]].
	(refs includesKey: #AnImageSegment) 
		ifTrue: [classInstVars := #()]
		ifFalse: [self saveClassInstVars].	"of UniClassses"
	^ (Array with: 'class structure' with: structures with: 'superclasses' with: superclasses)