dependency sorting
requirements

	^ self superclass == #nil
		ifTrue: [self pools]
		ifFalse: [(Array with: self superclass), self pools]