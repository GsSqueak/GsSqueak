menu commands
printIt
	| _gsSqueakTemp_oldEditor |
	textMorph editor selectFrom: selectionInterval first to: selectionInterval last;
		 model: model.
	"For, eg, evaluateSelection"
	textMorph
		handleEdit: [(_gsSqueakTemp_oldEditor := textMorph editor)
				evaluateSelectionAndDo: [:result | 
					selectionInterval := _gsSqueakTemp_oldEditor selectionInterval.
					textMorph installEditorToReplace: _gsSqueakTemp_oldEditor.
					textMorph
						handleEdit: [_gsSqueakTemp_oldEditor afterSelectionInsertAndSelect: result printString].
					selectionInterval := _gsSqueakTemp_oldEditor selectionInterval.
					textMorph editor selectFrom: selectionInterval first to: selectionInterval last.
					self scrollSelectionIntoView]]