costume
restoreBaseGraphic
	"Restore my base graphic"
	| _gsSqueakTemp_cos |
	(_gsSqueakTemp_cos := self costume renderedMorph) isSketchMorph
		ifTrue: [_gsSqueakTemp_cos restoreBaseGraphic]