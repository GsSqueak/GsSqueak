attributes
changeTextFont
	"Present a dialog which allows the user to select a font, and if one is
	chosen, apply it to the current selection.	If there is no selection, or the
	selection is empty, apply it to the whole morph."
	| _gsSqueakTemp_curFont _gsSqueakTemp_startIndex |
	_gsSqueakTemp_startIndex := self startIndex.
	_gsSqueakTemp_curFont := paragraph text fontAt: _gsSqueakTemp_startIndex withStyle: paragraph textStyle.
	morph
		openModal: (Cursor wait
				showWhile: [(FontChooserTool default
						withTitle: 'Change the selected text''s font to...' translated
						for: self
						setSelector: #changeSelectionFontTo:
						getSelector: _gsSqueakTemp_curFont) offerStyleList: false;
						 open
					"Do not allow changing the emphasis; we don't know
					how to deal with
					a 'pre-emphasized' font here, so bail."])