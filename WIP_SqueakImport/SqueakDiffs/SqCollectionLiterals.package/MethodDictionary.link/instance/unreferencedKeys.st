*SqCollections-removing
unreferencedKeys
	"| uk | (Time millisecondsToRun: [uk := TextConstants unreferencedKeys]) -> uk"

	^'Scanning for references . . .' 
		displayProgressFrom: 0
		to: Smalltalk classNames size * 2
		during: [ :bar |
			| currentClass n associations referencedAssociations |
			currentClass := nil.
			n := 0.
			associations := self associations asIdentitySet.
			referencedAssociations := IdentitySet new: associations size.
			self systemNavigation allSelectorsAndMethodsDo: [ :behavior :selector :method |
				behavior == currentClass ifFalse: [
					currentClass := behavior.
					 bar value: (n := n + 1) ].
				method literalsDo: [ :literal |
					(literal isVariableBinding and: [ associations includes: literal ]) ifTrue: [
						referencedAssociations add: literal ] ] ].
			(associations reject: [ :assoc | referencedAssociations includes: assoc ]) collect: [ :assoc| assoc key ] ]
