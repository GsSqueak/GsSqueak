invocation
invokeOn: targetObject
	"Pop up this menu and return the result of sending to the target object the selector corresponding to the menu item selected by the user. Return nil if no item is selected.  If the chosen selector has arguments, obtain them from my arguments"

	^ self invokeOn: targetObject orSendTo: nil