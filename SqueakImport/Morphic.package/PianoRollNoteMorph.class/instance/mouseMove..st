event handling
mouseMove: evt 
	| delta offsetEvt |
	editMode isNil 
		ifTrue: 
			["First movement determines edit mode"

			((delta := evt cursorPoint - hitLoc) dist: 0 @ 0) <= 2 
				ifTrue: [^self	"No significant movement yet."].
			delta x abs > delta y abs 
				ifTrue: 
					[delta x > 0 
						ifTrue: 
							["Horizontal drag"

							editMode := #selectNotes]
						ifFalse: 
							[self playSound: nil.
							offsetEvt := evt copy setCursorPoint: evt cursorPoint + (20 @ 0).
							self invokeNoteMenu: offsetEvt]]
				ifFalse: [editMode := #editPitch	"Vertical drag"]].
	editMode == #editPitch ifTrue: [self editPitch: evt].
	editMode == #selectNotes ifTrue: [self selectNotes: evt]