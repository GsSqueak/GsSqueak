invocation
invokeOn: targetObject defaultSelection: defaultSelection
	"Invoke the menu with the given default selection (i.e. one of my 'action' symbols). Answer the 'action' selector associated with the menu item chosen by the user or nil if none is chosen."

	| sel |
	sel := self startUp: defaultSelection.
	sel = nil ifFalse: [
		sel numArgs = 0
			ifTrue: [^ targetObject perform: sel]
			ifFalse: [^ targetObject perform: sel with: nil]].
	^ nil
