geometry
extent: newExtent
	| label |
	super extent: newExtent.
	submorphs size = 1 ifTrue:
		["keep the label centered"
		"NOTE: may want to test more that it IS a label..."
		label := self firstSubmorph.
		label position: self center - (label extent // 2)]