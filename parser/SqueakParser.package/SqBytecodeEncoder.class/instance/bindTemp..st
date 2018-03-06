temps
bindTemp: name 
	"Declare a temporary; error not if a field or class variable or
	out-of-scope temp."
	scopeTable
		at: name
		ifPresent: [:node | "When non-interactive raise the error only if it is a duplicate"
			node isTemp
				ifTrue: [node scope >= 0
						ifTrue: [^ self notify: 'Name already used in this method']]
				ifFalse: [self warnAboutShadowed: name]].
	^ self reallyBind: name