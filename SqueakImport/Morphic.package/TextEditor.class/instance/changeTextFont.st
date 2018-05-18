attributes
changeTextFont
	"Present a dialog which allows the user to select a font, and if one is chosen, apply it to the current selection.	If there is no selection, or the selection is empty, apply it to the whole morph."
	| curFont startIndex |
	startIndex := self startIndex.
	curFont := (paragraph text fontAt: startIndex withStyle: paragraph textStyle).
	morph openModal: (
		Cursor wait showWhile: [ 
			(FontChooserTool default
				withTitle: 'Change the selected text''s font to...' translated
				for: self 
				setSelector: #changeSelectionFontTo:
				getSelector: curFont)
			"Do not allow changing the emphasis; we don't know how to deal with
			a 'pre-emphasized' font here, so bail."
					offerStyleList: false;
					open])