initialize
primitiveSetBitBltPlugin
	"Primitive. Set the BitBlt plugin to use."
	| _gsSqueakTemp_pluginName |
	_gsSqueakTemp_pluginName := interpreterProxy stackValue: 0.
	"Must be string to work"
	(interpreterProxy isBytes: _gsSqueakTemp_pluginName)
		ifFalse: [^ interpreterProxy primitiveFail].
	(interpreterProxy stringOf: _gsSqueakTemp_pluginName)
			= bbPluginName
		ifTrue: [interpreterProxy pop: 1]
		ifFalse: [^ interpreterProxy primitiveFail]