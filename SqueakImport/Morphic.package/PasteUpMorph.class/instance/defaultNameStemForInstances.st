viewer
defaultNameStemForInstances
	"Answer a basis for names of default instances of the receiver"
	^ self isWorldMorph
		ifFalse:
			[super defaultNameStemForInstances]
		ifTrue:
			['world' translatedNoop]