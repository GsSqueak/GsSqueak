testing
hasLiteral: aLiteral 
	^ keyword == aLiteral
		or: [(arguments hasLiteral: aLiteral)
				or: [keyword == #hasLiteralTest:
						and: [self methodClass theNonMetaClass perform: arguments first with: aLiteral]]]