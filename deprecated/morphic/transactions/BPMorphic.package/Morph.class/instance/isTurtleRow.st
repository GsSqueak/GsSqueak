-Etoys
isTurtleRow
	| _gsSqueakTemp_aCollection _gsSqueakTemp_selectorCollection |
	_gsSqueakTemp_aCollection := Set new.
	_gsSqueakTemp_selectorCollection := Set new.
	self accumlatePlayersInto: _gsSqueakTemp_aCollection andSelectorsInto: _gsSqueakTemp_selectorCollection.
	#(#turtleCount: #turtleCount #grouped: #grouped )
		do: [:sel | (_gsSqueakTemp_selectorCollection includes: sel)
				ifTrue: [^ false]].
	_gsSqueakTemp_aCollection
		do: [:e | (e isKindOf: KedamaExamplerPlayer)
				ifTrue: [^ true]].
	^ false