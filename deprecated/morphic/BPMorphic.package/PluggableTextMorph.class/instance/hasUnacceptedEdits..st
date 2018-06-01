unaccepted edits
hasUnacceptedEdits: aBoolean 
	"Set the hasUnacceptedEdits flag to the given value."
	aBoolean == hasUnacceptedEdits
		ifFalse: [hasUnacceptedEdits := aBoolean.
			self changed].
	aBoolean
		ifFalse: [hasEditingConflicts := false]