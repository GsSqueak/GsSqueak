testing
isReturningIf
	^ ((special between: 3 and: 4)
			or: ["ifTrue:ifFalse:/ifFalse:ifTrue:"
				special between: 17 and: 18])
		and: ["ifNil:ifNotNil:/ifNotNil:ifNil:"
			arguments first returns
				and: [arguments last returns]]