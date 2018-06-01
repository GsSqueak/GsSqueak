handles
addChooseGraphicHandle: haloSpec 
	"If the target is a sketch morph, and if the governing preference is set,
	add a halo handle allowing the user to select a new graphic"
	(Preferences showChooseGraphicHaloHandle
			and: [innerTarget isSketchMorph])
		ifTrue: [self
				addHandle: haloSpec
				on: #mouseDown
				send: #chooseNewGraphicFromHalo
				to: innerTarget]