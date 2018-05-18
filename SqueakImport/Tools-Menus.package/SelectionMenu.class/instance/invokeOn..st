basic control sequence
invokeOn: targetObject
	"Pop up this menu and return the result of sending to the target object 
	the selector corresponding to the menu item selected by the user. Return 
	nil if no item is selected."

	| sel |
	sel := self startUp.
	sel = nil ifFalse: [^ targetObject perform: sel].
	^ nil

"Example:
	(SelectionMenu labels: 'sin
cos
neg' lines: #() selections: #(sin cos negated)) invokeOn: 0.7"