instance creation
doPrimitive: primitiveName withArguments: argArray 
	| _gsSqueakTemp_proxy _gsSqueakTemp_plugin |
	_gsSqueakTemp_proxy := InterpreterProxy new.
	_gsSqueakTemp_proxy loadStackFrom: thisContext sender.
	_gsSqueakTemp_plugin := (self simulatorClass
				ifNil: [self]) new.
	_gsSqueakTemp_plugin setInterpreter: _gsSqueakTemp_proxy.
	^ _gsSqueakTemp_plugin perform: primitiveName asSymbol withArguments: argArray