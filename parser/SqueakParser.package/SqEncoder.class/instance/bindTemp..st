temps
bindTemp: name 
	"Declare a temporary; error not if a field or class variable."
	scopeTable
		at: name
		ifPresent: [:node | "When non-interactive raise the error only if its a duplicate"
			node isTemp
				ifTrue: [^ self notify: 'Name already used in this method']
				ifFalse: [self warnAboutShadowed: name]].
	^ self reallyBind: name