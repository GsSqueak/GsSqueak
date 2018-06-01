*SqClasses-class membership
inheritsFromAnyIn: aList
	"Answer whether the receiver inherits from any class represented by any element in the list.  The elements of the list can be classes, class name symbols, or strings representing possible class names.  This allows speculative membership tests to be made even when some of the classes may not be known to the current image, and even when their names are not interned symbols."

	aList do:
		[:elem | Symbol hasInterned: elem asString ifTrue: 
			[:elemSymbol |
			| aClass |
			(((aClass := Smalltalk at: elemSymbol ifAbsent: [nil]) isKindOf: Class)
						and: [self isKindOf: aClass])
				ifTrue:
					[^ true]]].
	^ false


"
{3.  true. 'olive'} do:
	[:token |
		 {{#Number. #Boolean}. {Number.  Boolean }.  {'Number'. 'Boolean'}} do:
			[:list |
				Transcript cr; show: token asString, ' list element provided as a ', list first class name, ' - ', (token inheritsFromAnyIn: list) asString]]
"
