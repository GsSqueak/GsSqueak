instance creation
doPrimitive: primitiveName 
	| _gsSqueakTemp_proxy _gsSqueakTemp_plugin |
	_gsSqueakTemp_proxy := InterpreterProxy new.
	_gsSqueakTemp_proxy loadStackFrom: thisContext sender.
	_gsSqueakTemp_plugin := self simulatorClass new.
	_gsSqueakTemp_plugin setInterpreter: _gsSqueakTemp_proxy.
	(_gsSqueakTemp_plugin respondsTo: #initialiseModule)
		ifTrue: [_gsSqueakTemp_plugin initialiseModule].
	_gsSqueakTemp_plugin perform: primitiveName asSymbol.
	^ _gsSqueakTemp_proxy stackValue: 0