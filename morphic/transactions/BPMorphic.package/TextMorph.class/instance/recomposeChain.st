linked frames
recomposeChain
	"Recompose this textMorph and all that follow it."
	self
		withSuccessorsDo: [:m | m text: text textStyle: textStyle;
				 releaseParagraph;
				 fit
			"Propagate new style if any"
			"Force recomposition"
			"and propagate the change"]