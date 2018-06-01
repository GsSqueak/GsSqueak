opening
openDebugger: aSpec 
	| _gsSqueakTemp_morph |
	_gsSqueakTemp_morph := self build: aSpec.
	_gsSqueakTemp_morph openInWorld: Project current world extent: _gsSqueakTemp_morph extent.
	^ _gsSqueakTemp_morph