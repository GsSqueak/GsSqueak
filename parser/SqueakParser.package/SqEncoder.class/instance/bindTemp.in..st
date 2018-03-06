temps
bindTemp: name in: methodSelector 
	"Declare a temporary; error not if a field or class variable."
	scopeTable
		at: name
		ifPresent: [:node | "When non-interactive raise the error only if its a duplicate"
			(node isTemp
					or: [requestor interactive])
				ifTrue: [^ self notify: 'Name already used in this method']
				ifFalse: [Transcript show: '(' , name , ' is shadowed in "' , cue getClass printString , '>>' , methodSelector printString , '")']].
	^ self reallyBind: name