private
basicBoxForSimpleHalos
	| w |
	w := self world ifNil:[target outermostWorldMorph].
	^ (target topRendererOrSelf worldBoundsForHalo expandBy: self handleAllowanceForIconicHalos)
			intersect: (w bounds insetBy: 8@8)
