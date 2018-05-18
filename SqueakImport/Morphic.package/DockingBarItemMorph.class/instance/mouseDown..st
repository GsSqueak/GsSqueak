events
mouseDown: evt
	"Handle a mouse down event. Menu items get activated when the mouse is over them."

	(evt shiftPressed and:[self wantsKeyboardFocusOnShiftClick]) ifTrue: [ ^super mouseDown: evt ].  "enable label editing" 
	isSelected
		ifTrue: [
			owner selectItem: nil event: evt. ]
		ifFalse: [
			owner activate: evt. "Redirect to menu for valid transitions"
			owner selectItem: self event: evt. ]
