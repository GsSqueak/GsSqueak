as yet unclassified
transformedMethodSource: aMethodSymbol
		
	^  BPCodeTransformer new transformMethod: (self sourceCodeAt: aMethodSymbol) class: self expectsExclamationMark: false.
