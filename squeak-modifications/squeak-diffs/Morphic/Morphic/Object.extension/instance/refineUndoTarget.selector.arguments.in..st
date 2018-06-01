*Morphic-MorphicExtras-Undo
refineUndoTarget: target selector: aSymbol arguments: arguments in: refineBlock 
	"Any object can override this method to refine its undo specification"

	^ refineBlock
		value: target
		value: aSymbol
		value: arguments