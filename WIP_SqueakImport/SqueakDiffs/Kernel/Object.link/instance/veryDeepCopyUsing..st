copying
veryDeepCopyUsing: copier
	"Do a complete tree copy using a dictionary.  An object in the tree twice is only copied once.  All references to the object in the copy of the tree will point to the new copy.
	Same as veryDeepCopy except copier (with dictionary) is supplied.
	** do not delete this method, even if it has no callers **"

	| new refs |
	new := self veryDeepCopyWith: copier.
	copier mapUniClasses.
	copier references associationsDo: [:assoc | 
		assoc value veryDeepFixupWith: copier].
	"Fix dependents"
	refs := copier references.
	DependentsFields associationsDo: [:pair |
		pair value do: [:dep | 
			| newDep newModel |
			(newDep := refs at: dep ifAbsent: [nil]) ifNotNil: [
				newModel := refs at: pair key ifAbsent: [pair key].
				newModel addDependent: newDep]]].
	^ new
