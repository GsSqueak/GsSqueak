testing method dictionary
whichSelectorsReferTo: literal special: specialFlag byte: specialByte thorough: thorough
	"Answer a set of selectors whose methods access the argument as a literal. If thorough is true, then dives into the compact literal notation, making it slow but thorough "

	| who |
	who := IdentitySet new.
	self selectorsAndMethodsDo: [ :selector :method |
		(((thorough
			ifFalse: [ method hasLiteral: literal ]
			ifTrue: [ method hasLiteralThorough: literal ]) or: [
				specialFlag and: [ method scanFor: specialByte ] ]) and: [
			literal isVariableBinding not or: [
				"N.B. (method indexOfLiteral: literal) < method numLiterals copes with l;ooking for
				Float bindingOf: #NaN, since (Float bindingOf: #NaN) ~= (Float bindingOf: #NaN)."
				(method indexOfLiteral: literal) ~= 0] ]) ifTrue: [
			who add: selector ] ].
	^who