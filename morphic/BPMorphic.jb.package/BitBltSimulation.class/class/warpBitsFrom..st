system simulation
warpBitsFrom: aBitBlt 
	"Simulate the warpBits primitive"
	| _gsSqueakTemp_proxy _gsSqueakTemp_bb |
	_gsSqueakTemp_proxy := InterpreterProxy new.
	_gsSqueakTemp_proxy loadStackFrom: thisContext sender home.
	_gsSqueakTemp_bb := self simulatorClass new.
	_gsSqueakTemp_bb initialiseModule.
	_gsSqueakTemp_bb setInterpreter: _gsSqueakTemp_proxy.
	_gsSqueakTemp_proxy
		success: (_gsSqueakTemp_bb loadWarpBltFrom: aBitBlt).
	_gsSqueakTemp_bb warpBits.
	_gsSqueakTemp_proxy failed
		ifFalse: [_gsSqueakTemp_proxy
				showDisplayBits: aBitBlt destForm
				Left: _gsSqueakTemp_bb affectedLeft
				Top: _gsSqueakTemp_bb affectedTop
				Right: _gsSqueakTemp_bb affectedRight
				Bottom: _gsSqueakTemp_bb affectedBottom].
	^ _gsSqueakTemp_proxy stackValue: 0