as yet unclassified
myTransformation

	^submorphs detect: [ :x | x isKindOf: TransformationMorph] ifNone: [nil]
