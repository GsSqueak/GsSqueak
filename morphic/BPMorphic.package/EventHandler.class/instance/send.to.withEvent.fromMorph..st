events
send: selector to: recipient withEvent: event fromMorph: sourceMorph 
	| _gsSqueakTemp_arity |
	recipient
		ifNil: [^ self].
	_gsSqueakTemp_arity := selector numArgs.
	_gsSqueakTemp_arity = 0
		ifTrue: [^ recipient perform: selector].
	_gsSqueakTemp_arity = 1
		ifTrue: [^ recipient perform: selector with: event].
	_gsSqueakTemp_arity = 2
		ifTrue: [^ recipient
				perform: selector
				with: event
				with: sourceMorph].
	_gsSqueakTemp_arity = 3
		ifTrue: [^ recipient
				perform: selector
				with: valueParameter
				with: event
				with: sourceMorph].
	self error: 'Event handling selectors must be Symbols and take 0-3 arguments'