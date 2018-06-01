initialization
selectedClassName
	"Answer the name of the class currently selected.   di
	  bug fix for the case where name cannot be found -- return nil rather than halt"

	| aName |
	aName := super selectedClassName.
	aName ifNil: [ ^ nil ].
	^ (aName copyWithout: Character space) asSymbol