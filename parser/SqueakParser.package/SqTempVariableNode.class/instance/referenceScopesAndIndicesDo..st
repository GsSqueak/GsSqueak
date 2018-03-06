closure analysis
referenceScopesAndIndicesDo: aBinaryBlock 
	"Evaluate aBinaryBlock with all read or write scopes and locations.
	This is used to copy the reference information into
	RemoteTempVectorNodes"
	readingScopes ~~ nil
		ifTrue: [readingScopes
				keysAndValuesDo: [:scopeBlock :set | "<BlockNode>"
					"<Set of <Integer>>"
					set
						do: [:location | aBinaryBlock value: scopeBlock value: location]]].
	writingScopes ~~ nil
		ifTrue: [writingScopes
				keysAndValuesDo: [:scopeBlock :set | "<BlockNode>"
					"<Set of <Integer>>"
					set
						do: [:location | aBinaryBlock value: scopeBlock value: location]]]