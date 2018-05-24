loading
methodsInDirectory: aFileDirectory

	| methods |
	methods := OrderedCollection new.
	aFileDirectory entriesDo: [:entry |
		(entry isDirectory not and: [entry extension = 'st']) ifTrue: [
			methods add: (GSSMethodDefinition newFromFile: entry)]].
	^ methods