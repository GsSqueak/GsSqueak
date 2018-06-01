-Etoys-tile colors
colorForType: typeSymbol 
	"Answer the color to use to represent the given type symbol"
	true
		ifTrue: [^ self standardTileBorderColor].
	typeSymbol capitalized = #Command
		ifTrue: [^ Color fromRgbTriplet: #(0.065 0.258 1.0 )].
	"Command is historical and idiosyncratic and should be regularized"
	^ (Vocabulary vocabularyForType: typeSymbol) typeColor