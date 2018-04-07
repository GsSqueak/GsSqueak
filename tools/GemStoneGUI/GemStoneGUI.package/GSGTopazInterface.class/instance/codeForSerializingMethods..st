helpers
codeForSerializingMethods: methodArrayCreationCode

	^ '[:methods |
	| result |
	result := OrderedCollection new.
	methods do: [ :method | 
		' , (self codeForSerializingMethod: 'method' onCollection: 'result') , '].
	result] value: (' , methodArrayCreationCode , $)