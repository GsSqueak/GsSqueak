model access
setSelection: sel

	"Give the model a chance to just leave the selection where it currently is."
	sel ifNil: [^ self].

	selectionInterval := sel.
	textMorph editor selectFrom: sel first to: sel last.
	self scrollSelectionIntoView.