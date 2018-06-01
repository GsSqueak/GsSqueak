rotate scale and flex
addFlexShell
	"Wrap a rotating and scaling shell around this morph."

	| oldHalo myWorld flexMorph anIndex |

	oldHalo:= self halo.
	myWorld := self world.
	self owner
		ifNil: [flexMorph := self newTransformationMorph asFlexOf: self]
		ifNotNil: [:myOwner |
			anIndex := myOwner submorphIndexOf: self.
			flexMorph := self newTransformationMorph asFlexOf: self.
			myOwner addMorph: flexMorph asElementNumber: anIndex.
			myWorld ifNotNil: [myWorld startSteppingSubmorphsOf: flexMorph]].
	self transferStateToRenderer: flexMorph.
	oldHalo ifNotNil: [oldHalo setTarget: flexMorph].

	^ flexMorph