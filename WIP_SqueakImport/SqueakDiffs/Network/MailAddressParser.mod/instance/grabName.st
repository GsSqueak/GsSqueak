parsing
grabName

	| name |
	name := ''.
	[tokens isEmpty not and: [#(Atom QuotedString $. $@) includes: (tokens last type) ]] 
		whileTrue: [ name := {tokens removeLast text copyWithoutAll: '"'. name} joinSeparatedBy: Character space ].
	^ name withBlanksTrimmed