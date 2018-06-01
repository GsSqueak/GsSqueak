private
buildHelpFor: widget spec: aSpec
	aSpec help ifNotNil: [:stringOrSymbol |
		stringOrSymbol isSymbol
			ifTrue: [widget balloonTextSelector: stringOrSymbol]
			ifFalse: [widget balloonText: stringOrSymbol]].