label
labelHeight
	"Answer the height for the window label. The standard behavior is at
	bottom; a hook is provided so that models can stipulate other heights,
	in support of various less-window-looking demos."
	(model notNil
			and: [model respondsTo: #desiredWindowLabelHeightIn:])
		ifTrue: [(model desiredWindowLabelHeightIn: self)
				ifNotNil: [:_gsSqueakTemp_aHeight | ^ _gsSqueakTemp_aHeight]].
	^ label
		ifNil: [0]
		ifNotNil: [label height + self cellInset + self layoutInset
				max: (collapseBox
						ifNil: [10]
						ifNotNil: [collapseBox height])]