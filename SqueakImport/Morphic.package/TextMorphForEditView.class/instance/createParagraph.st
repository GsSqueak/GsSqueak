private
createParagraph

	super createParagraph.
	
	paragraph
		caretColor: self caretColor;
		selectionColor: self selectionColor;
		unfocusedSelectionColor: self unfocusedSelectionColor.
		
	^ paragraph