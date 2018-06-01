event handling
yellowButtonActivity: shiftKeyState 
	"Invoke the text-editing menu"
	(self getMenu: shiftKeyState)
		ifNotNil: [:_gsSqueakTemp_menu | 
			""
			_gsSqueakTemp_menu setInvokingView: self editor.
			self flag: #refactor.
			"mt: This should work non-modally..."
			_gsSqueakTemp_menu invokeModal.
			self changed]