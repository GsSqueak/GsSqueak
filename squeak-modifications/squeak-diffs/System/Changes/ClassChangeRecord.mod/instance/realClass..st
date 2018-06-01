isolation layers
realClass: anEnvironment
	"Return the actual class (or meta), as determined from my name."
	thisName ifNil: [^ nil].
	(thisName endsWith: ' class')
		ifTrue: [^ (anEnvironment at: (thisName copyFrom: 1 to: thisName size - 6) asSymbol
						ifAbsent: [nil]) class]
		ifFalse: [^ anEnvironment at: thisName ifAbsent: [nil]]