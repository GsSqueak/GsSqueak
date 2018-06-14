dependency sorting
nonLinkedRequirements

	^ self superclass == #nil
		ifTrue: [self pools]
		ifFalse: [(Array with: self superclass), self pools]