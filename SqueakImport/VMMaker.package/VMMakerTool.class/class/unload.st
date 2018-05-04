unloading
unload
	Smalltalk at: #TheWorldMenu ifPresent: [ :class |
		class class methodDict at: #unregisterOpenCommandWithReceiver: ifPresent: [ :method |
			(method hasLiteral: #deprecated:) 
				ifFalse: [ class unregisterOpenCommandWithReceiver: self ] ] ]