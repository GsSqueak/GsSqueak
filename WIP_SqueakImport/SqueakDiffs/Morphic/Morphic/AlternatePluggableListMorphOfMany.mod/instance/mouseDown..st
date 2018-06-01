event handling
mouseDown: event
	| row |

	event yellowButtonPressed ifTrue: [^ self yellowButtonActivity: event shiftPressed].

	row := self rowAtLocation: event position.
	
	row = 0 ifTrue: [^super mouseDown: event].

	model okToChange ifFalse: [^ self].  "No change if model is locked"

	"Inform model of selected item and let it toggle."
	self
		changeModelSelection: (self modelIndexFor: row)
		shifted: event shiftPressed
		controlled: event controlKeyPressed.


"
	event hand releaseMouseFocus: aMorph.
	submorphs do: [ :each | each changed ]
"