defaults
selectionBackground
	"The background for selected items in lists and tree-list thingies."
	^ self subduedHilites ifTrue: [
			Preferences textHighlightColor 
		] ifFalse: [
			"This is tuned so the red-foreground used for list texts stays somewhat legible."
			Color r: 0.8 g:0.8 b: 0.81 alpha: 0.85 
		].
