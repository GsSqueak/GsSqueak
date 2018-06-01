styling
stylerStyled: styledCopyOfText
	"Sent after the styler completed styling the underlying text. The behavior is similar to #handleInteraction:event: but we do not have to copy text ore make those other checks."
	
	textMorph contents runs: styledCopyOfText runs .

	textMorph paragraph composeAll.
	textMorph editor recomputeSelection.
	textMorph updateFromParagraph.

	textMorph editor blinkParen.
	self scrollSelectionIntoView.