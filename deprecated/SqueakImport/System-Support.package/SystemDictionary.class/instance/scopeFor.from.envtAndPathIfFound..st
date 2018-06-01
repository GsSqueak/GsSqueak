dictionary access
scopeFor: varName from: lower envtAndPathIfFound: envtAndPathBlock
	"Null compatibility with partitioning into environments."

	(self includesKey: varName)
		ifTrue: [^ envtAndPathBlock value: self value: String new]
		ifFalse: [^ nil]