replacement
replacePartSatisfying: elementBlock inGlobalFlapSatisfying: flapBlock with: replacement 
	"If any global flap satisfies flapBlock, look in it for a part satisfying
	elementBlock; if such a part is found, replace it with the replacement
	morph, make sure the flap's layout is made right, etc."
	| _gsSqueakTemp_aFlapTab _gsSqueakTemp_flapPasteUp _gsSqueakTemp_anElement |
	_gsSqueakTemp_aFlapTab := self globalFlapTabsIfAny
				detect: flapBlock
				ifNone: [^ self].
	_gsSqueakTemp_flapPasteUp := _gsSqueakTemp_aFlapTab referent.
	_gsSqueakTemp_anElement := _gsSqueakTemp_flapPasteUp submorphs
				detect: elementBlock
				ifNone: [^ self].
	_gsSqueakTemp_flapPasteUp replaceSubmorph: _gsSqueakTemp_anElement by: replacement.
	_gsSqueakTemp_flapPasteUp replaceTallSubmorphsByThumbnails; setPartsBinStatusTo: true