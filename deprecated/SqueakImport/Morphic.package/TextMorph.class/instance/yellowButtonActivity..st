event handling
yellowButtonActivity: shiftKeyState 
	"Invoke the text-editing menu"
	| menu |
	(menu := self getMenu: shiftKeyState)
		ifNotNil: [""
			menu setInvokingView: self editor.
			self flag: #refactor. "mt: This should work non-modally..."
			menu invokeModal. self changed]