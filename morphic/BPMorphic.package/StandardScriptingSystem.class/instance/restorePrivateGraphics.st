-Etoys-form dictionary
restorePrivateGraphics
	"ScriptingSystem restorePrivateGraphics"
	| _gsSqueakTemp_aReferenceStream |
	_gsSqueakTemp_aReferenceStream := ReferenceStream fileNamed: 'disGraphics'.
	self mergeGraphicsFrom: _gsSqueakTemp_aReferenceStream next.
	_gsSqueakTemp_aReferenceStream close