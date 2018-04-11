geometry
extent: newExtent 
	| _gsSqueakTemp_label |
	super extent: newExtent.
	submorphs size = 1
		ifTrue: ["keep the label centered"
			"NOTE: may want to test more that it IS a label..."
			_gsSqueakTemp_label := self firstSubmorph.
			_gsSqueakTemp_label position: self center - (_gsSqueakTemp_label extent // 2)]