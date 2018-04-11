events-processing
handlerForMouseDown: evt 
	"Answer an object to field the mouseDown event provided, or nil if
	none "
	| _gsSqueakTemp_aHandler |
	_gsSqueakTemp_aHandler := super handlerForMouseDown: evt.
	_gsSqueakTemp_aHandler == self
		ifTrue: [^ self].
	"I would get it anyways"
	"Note: This is a hack to allow value editing in viewers"
	((owner wantsKeyboardFocusFor: self)
			and: [self userEditsAllowed])
		ifTrue: [^ self].
	^ _gsSqueakTemp_aHandler