viewer
defaultNameStemForInstances	"Answer a basis for names of default instances of the receiver"	^ self isWorldMorph		ifTrue: ['world']		ifFalse: [super defaultNameStemForInstances]