adding
add: argName value: argValue
	| argAssociation |
	argAssociation := self argumentNamed: argName.
	argAssociation isNil
		ifTrue: [self add: (argName -> (OrderedCollection with: argValue))]
		ifFalse: [argAssociation value add: argValue]