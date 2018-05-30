initialization
tweakAppearanceAfterModeShift
	"After the receiver has been put into a given mode, make an initial selection of category, if appropriate, and highlight the mode button."

	self buttonPane submorphs do:
		[:aButton | 
			| aColor |
			"aButton borderWidth: 1."
			aColor := (aButton valueOfProperty: #modeSymbol) = modeSymbol
				ifTrue: [Color red]
				ifFalse: [Color black].

			aButton firstSubmorph color: aColor.
			aButton borderColor: aColor.
		].