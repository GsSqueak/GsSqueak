construction support
addMorph: aMorph asElementNumber: aNumber inGlobalFlapSatisfying: flapBlock 
	"If any global flap satisfies flapBlock, add aMorph to it at the given
	position. Applies to flaps that are parts bins and that like
	thumbnailing "
	| _gsSqueakTemp_aFlapTab _gsSqueakTemp_flapPasteUp |
	_gsSqueakTemp_aFlapTab := self globalFlapTabsIfAny
				detect: flapBlock
				ifNone: [^ self].
	_gsSqueakTemp_flapPasteUp := _gsSqueakTemp_aFlapTab referent.
	_gsSqueakTemp_flapPasteUp addMorph: aMorph asElementNumber: aNumber.
	_gsSqueakTemp_flapPasteUp replaceTallSubmorphsByThumbnails; setPartsBinStatusTo: true