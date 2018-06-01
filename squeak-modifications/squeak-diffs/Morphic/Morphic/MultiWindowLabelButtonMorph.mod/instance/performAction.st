accessing
performAction
	"Override to interpret the actionSelector as a menu accessor and to activate that menu."
	actionSelector ifNotNil:
		[(model perform: actionSelector) ifNotNil:
			[:menu|
			menu
				invokeModalAt: self position - (0@5)
				in: ActiveWorld
				allowKeyboard: Preferences menuKeyboardControl]]