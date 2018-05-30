code pane menu
toggleStyling

	shouldStyle := self shouldStyle not.
	" Ugly hack, to restyle our contents. "
	self codeTextMorph in: [ :codeTextMorph |
		codeTextMorph setText:
			codeTextMorph textMorph text asString asText ]