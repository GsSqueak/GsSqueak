primitive support
ioLoadExternalFunction: functionName OfLength: functionLength FromModule: moduleName OfLength: moduleLength AccessorDepthInto: accessorDepthPtr 
	"Load and return the requested function from a module. Assign the
	accessor depth through accessorDepthPtr.
	N.B. The actual code lives in platforms/Cross/vm/sqNamedPrims.h"
	| _gsSqueakTemp_pluginString _gsSqueakTemp_functionString |
	_gsSqueakTemp_pluginString := String new: moduleLength.
	(1 to: moduleLength)
		do: [:i | _gsSqueakTemp_pluginString
				byteAt: i
				put: (objectMemory byteAt: moduleName + i - 1)].
	_gsSqueakTemp_functionString := String new: functionLength.
	(1 to: functionLength)
		do: [:i | _gsSqueakTemp_functionString
				byteAt: i
				put: (objectMemory byteAt: functionName + i - 1)].
	"We used to ignore loads of the SqueakFFIPrims plugin, but that
	means doing without integerAt:[put:]size:signed:
	which is too much of a limitation (not that these simulate unaligned
	accesses yet)."
	^ self
		ioLoadFunction: _gsSqueakTemp_functionString
		From: _gsSqueakTemp_pluginString
		AccessorDepthInto: accessorDepthPtr