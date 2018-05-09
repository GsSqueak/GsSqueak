public access
typedScan: textOrString do: aBinaryBlock
	"Evaluate aBinaryBlock with the token and its type for the first token in input,
	 mapping literals to type #literal and anything else to type #word."
	| theTokensType atNumber theToken |
	self initScannerForTokenization.
	self scan: (ReadStream on: textOrString asString).
	atNumber := hereChar notNil and: [hereChar isDigit].
	theTokensType := tokenType.
	theToken := self advance.
	(theToken == #- and: [atNumber and: [token isNumber]]) ifTrue:
		[theToken := self advance negated].
	theToken isNumber ifTrue: [theTokensType := #number].
	^aBinaryBlock
		value: theToken
		value: ((#(number string literal) includes: theTokensType)
				ifTrue: [#literal]
				ifFalse: [#word])