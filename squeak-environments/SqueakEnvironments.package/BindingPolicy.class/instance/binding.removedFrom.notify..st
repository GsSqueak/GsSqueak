events
binding: aBinding removedFrom: anEnvironment notify: anObject 
	environment == anEnvironment
		ifTrue: [policy
				name: aBinding key
				do: [:name | 
					| binding |
					binding := aBinding asBinding: name.
					anObject perform: removeSelector with: binding]]