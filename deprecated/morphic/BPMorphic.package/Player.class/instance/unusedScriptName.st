misc
unusedScriptName
	"answer a name of the form 'scriptN', where N is one higher than the
	highest-numbered similarly-named script"
	| _gsSqueakTemp_highestThus |
	_gsSqueakTemp_highestThus := 0.
	self class tileScriptNames
		do: [:aName | 
			| aPair |
			aPair := (aName copyWithout: $:) stemAndNumericSuffix.
			aPair first = 'script' translated
				ifTrue: [_gsSqueakTemp_highestThus := _gsSqueakTemp_highestThus max: aPair last]].
	^ ('script' translated , (_gsSqueakTemp_highestThus + 1) printString) asSymbol