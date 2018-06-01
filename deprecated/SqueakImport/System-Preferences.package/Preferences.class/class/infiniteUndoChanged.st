updating - system
infiniteUndoChanged
	"The infiniteUndo preference changed; react"
	
	self infiniteUndo ifFalse:
		[CommandHistory resetAllHistory]