image save/restore
initializeImageFormatVersion
	"Set the imageFormatVersionNumber. The imageFormatInitialVersion will
	have been set at image load time. The imageFormatVerison may later by
	updated by pushClosureCopyCopiedValuesBytecode in the case of a
	non-closure image that is being updated automatically to use closures."

	<inline: false>
	imageFormatVersionNumber = 0 ifTrue: [
		imageFormatInitialVersion caseOf: {
			[ 6502 ] -> [ imageFormatVersionNumber := 6502 ] . "early 32 bit format"
			[ 6504 ] -> [ imageFormatVersionNumber := 6504 ] . "closures"
			[ 6505 ] -> [ imageFormatVersionNumber := 6504 ] . "float order was restored during image load"
			[ 68000 ] -> [ imageFormatVersionNumber := 68000 ] . "early 64 bit format"
			[ 68002 ] -> [ imageFormatVersionNumber := 68002 ] . "closures"
			[ 68003 ] -> [ imageFormatVersionNumber := 68002 ]	"float order was restored during image load"
		} ].
