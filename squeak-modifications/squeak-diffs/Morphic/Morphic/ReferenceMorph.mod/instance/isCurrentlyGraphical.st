accessing
isCurrentlyGraphical
	"Answer whether the receiver is currently showing a graphical face"

	| first |
	^submorphs notEmpty and: 
			[((first := submorphs first) isKindOf: ImageMorph) 
				or: [first isSketchMorph]]