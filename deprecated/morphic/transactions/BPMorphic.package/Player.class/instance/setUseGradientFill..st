slot getters/setters
setUseGradientFill: aBoolean 
	"Setter for costume's useGradientFill"
	costume renderedMorph fillStyle isGradientFill
		ifTrue: [aBoolean
				ifFalse: [costume renderedMorph useSolidFill]]
		ifFalse: [aBoolean
				ifTrue: [costume renderedMorph useGradientFill]]