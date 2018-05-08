running
expectedFailures
	"Tests for text attributes that are apparently unused, and that may be candidates
	for removal from the image"
	^#(
		testTextAnchor
		testTextIndent
		testTextMessageLink
		testTextPlusJumpStart
		testTextPlusJumpEnd
		
		"Actually failing tests which document bugs to be fixed (pre)"
		testTextFontReferenceForBoldFont
		testTextFontReferenceTTCForBoldFont
		)