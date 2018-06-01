private
basicBoxForSimpleHalos
	| _gsSqueakTemp_w |
	_gsSqueakTemp_w := self world
				ifNil: [target outermostWorldMorph].
	^ (target topRendererOrSelf worldBoundsForHalo expandBy: self handleAllowanceForIconicHalos)
		intersect: (_gsSqueakTemp_w bounds insetBy: 8 @ 8)