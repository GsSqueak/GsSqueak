styling
stylerStyledInBackground: styledCopyOfText 
	"Sent after the styler completed styling of the text"
	"It is possible that the text string	has changed since the styling began.
	Disregard the styles if styledCopyOfText's string differs with the
	current textMorph contents string"
	Project current
		addDeferredUIMessage: [textMorph contents string = styledCopyOfText string
				ifTrue: [self stylerStyled: styledCopyOfText]]