world state
endDrawing: evt 
	"If painting is already underway
	in the receiver, finish and save it."
	self sketchEditorOrNil
		ifNotNil: [:editor | 
			editor save: evt.
			Cursor normal show]