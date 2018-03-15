emulating
scopeFor: aSymbol from: lower envtAndPathIfFound: aBlock 
	^ (declarations includesKey: aSymbol)
		ifTrue: [aBlock value: self value: String new]