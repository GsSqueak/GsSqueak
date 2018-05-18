typing/selecting keys
tabCount
	^ self class autoIndent
		ifTrue:
			[ | tabCount s i char |
			s := paragraph string.
			i := self stopIndex.
			tabCount := 0.
			[(i := i-1) > 0 and: [(char := s at: i) ~= Character cr and: [char ~= Character lf]]]
				whileTrue:  "Count tabs and brackets (but not a leading bracket)"
				[(char = Character tab and: [i < s size and: [(s at: i+1) ~= $[ ]]) ifTrue: [tabCount := tabCount + 1].
				char = $[ ifTrue: [tabCount := tabCount + 1].
				char = $] ifTrue: [tabCount := tabCount - 1]].
			tabCount ]
		ifFalse: [ 0 ]