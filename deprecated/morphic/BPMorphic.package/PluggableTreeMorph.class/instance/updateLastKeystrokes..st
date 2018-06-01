event handling
updateLastKeystrokes: aChar 
	| _gsSqueakTemp_milliseconds _gsSqueakTemp_slowKeyStroke |
	_gsSqueakTemp_milliseconds := Time millisecondClockValue.
	_gsSqueakTemp_slowKeyStroke := (Time milliseconds: _gsSqueakTemp_milliseconds since: lastKeystrokeTime)
				> (PluggableListMorph filterableLists
						ifTrue: [500]
						ifFalse: [300]).
	lastKeystrokeTime := _gsSqueakTemp_milliseconds.
	_gsSqueakTemp_slowKeyStroke
		ifTrue: [lastKeystrokes := aChar asLowercase asString]
		ifFalse: [lastKeystrokes := lastKeystrokes , aChar asLowercase asString]