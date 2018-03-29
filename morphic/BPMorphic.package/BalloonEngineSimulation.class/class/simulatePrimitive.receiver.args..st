simulation
simulatePrimitive: aString receiver: rcvr args: args 
	| _gsSqueakTemp_proxy _gsSqueakTemp_bb |
	_gsSqueakTemp_proxy := InterpreterProxy new.
	_gsSqueakTemp_proxy synthesizeStackFor: rcvr with: args.
	_gsSqueakTemp_bb := self simulatorClass new.
	_gsSqueakTemp_bb setInterpreter: _gsSqueakTemp_proxy.
	_gsSqueakTemp_bb initialiseModule.
	"rendering state is loaded in the primitive implementations"
	[_gsSqueakTemp_bb perform: aString asSymbol]
		on: Exception
		do: [:ex | _gsSqueakTemp_proxy success: false].
	^ _gsSqueakTemp_proxy stackValue: 0