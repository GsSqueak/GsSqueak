stepping and presenter
undoButtonWording
	"Answer the wording for the Undo button."

	| wdng |
	wdng := ActiveWorld commandHistory undoOrRedoMenuWording.
	(wdng endsWith: ' (z)') ifTrue:
		[wdng := wdng copyFrom: 1to: wdng size - 4].
	^ wdng