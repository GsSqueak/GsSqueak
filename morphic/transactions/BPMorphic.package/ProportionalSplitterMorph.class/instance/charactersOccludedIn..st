layout
charactersOccludedIn: aCollection 
	^ aCollection
		inject: 0
		into: [:sum :each | sum
				+ (each isMorphicModel
						ifTrue: [each charactersOccluded]
						ifFalse: [0])]