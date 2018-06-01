traits
addTrait
	| input trait |
	input := UIManager default request: 'add trait'.
	input isEmptyOrNil ifFalse: [
		trait := Smalltalk classNamed: input.
		(trait isNil or: [trait isTrait not]) ifTrue: [
			^self inform: 'Input invalid. ' , input , ' does not exist or is not a trait'].
		self selectedClass setTraitComposition: self selectedClass traitComposition asTraitComposition +  trait.
		self contentsChanged].
