accessing
isCurrentlyGraphical
	"Answer whether the receiver is currently showing a graphical face"
	| _gsSqueakTemp_first |
	^ submorphs notEmpty
		and: [((_gsSqueakTemp_first := submorphs first) isKindOf: ImageMorph)
				or: [_gsSqueakTemp_first isSketchMorph]]