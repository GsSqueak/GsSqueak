primitives-access
primitiveSetBitBltPlugin
	"Primitive. Set the BitBlt plugin to use."
	| _gsSqueakTemp_pluginName _gsSqueakTemp_length _gsSqueakTemp_ptr _gsSqueakTemp_needReload |
	_gsSqueakTemp_pluginName := interpreterProxy stackValue: 0.
	"Must be string to work"
	(interpreterProxy isBytes: _gsSqueakTemp_pluginName)
		ifFalse: [^ interpreterProxy primitiveFail].
	_gsSqueakTemp_length := interpreterProxy byteSizeOf: _gsSqueakTemp_pluginName.
	_gsSqueakTemp_length >= 256
		ifTrue: [^ interpreterProxy primitiveFail].
	_gsSqueakTemp_ptr := interpreterProxy firstIndexableField: _gsSqueakTemp_pluginName.
	_gsSqueakTemp_needReload := false.
	0
		to: _gsSqueakTemp_length - 1
		do: [:i | "Compare and store the plugin to be used"
			(bbPluginName at: i)
					= (_gsSqueakTemp_ptr at: i)
				ifFalse: [bbPluginName
						at: i
						put: (_gsSqueakTemp_ptr at: i).
					_gsSqueakTemp_needReload := true]].
	(bbPluginName at: _gsSqueakTemp_length)
			= 0
		ifFalse: [bbPluginName at: _gsSqueakTemp_length put: 0.
			_gsSqueakTemp_needReload := true].
	_gsSqueakTemp_needReload
		ifTrue: [self initialiseModule
				ifFalse: [^ interpreterProxy primitiveFail]].
	interpreterProxy pop: 1