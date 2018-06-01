world state
endDrawing: evt
	"If painting is already underway
	in the receiver, finish and save it."
	| editor |
	(editor := self sketchEditorOrNil) ifNotNil:[
		editor save: evt.
		Cursor normal show.
	].