accessing
changeCounter

	^ChangeCounter ifNil: [ChangeCounter := 0].