accessing
methodReferences

	^methodReferences ifNil: [
		methodReferences := messageList collect: [ :each | self methodReferenceFrom: each ] ]
