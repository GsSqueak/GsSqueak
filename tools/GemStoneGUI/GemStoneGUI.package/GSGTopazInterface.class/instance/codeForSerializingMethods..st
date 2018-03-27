helpers
codeForSerializingMethods: methodArrayCreationCode

	^ '[:methods |
	| result |
	result := OrderedCollection new.
	methods do: [ :method | 
		result add: method inClass name.
		result add: method selector.
		result add: method environmentId.
		result add: (method inClass categoryOfSelector: method selector environmentId: method environmentId)].
	result] value: (' , methodArrayCreationCode , $)