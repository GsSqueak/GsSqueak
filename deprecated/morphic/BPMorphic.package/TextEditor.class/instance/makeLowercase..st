editing keys
makeLowercase: aKeyboardEvent 
	"Force the current selection to lowercase. Triggered by Cmd-X."
	self replaceSelectionWith: self selection string asLowercase.
	^ true