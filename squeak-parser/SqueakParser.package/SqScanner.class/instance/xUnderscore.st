multi-character scans
xUnderscore
	self allowUnderscoreAssignments
		ifTrue: [| type | "Figure out if x _foo (no space between _ and foo) 
			should be a selector or assignment"
			(((type := self typeTableAt: aheadChar) == #xLetter
						or: [type == #xDigit
								or: [type == #xUnderscore]])
					and: [self allowUnderscoreSelectors])
				ifFalse: [self step.
					tokenType := #leftArrow.
					^ token := #'_']].
	self allowUnderscoreSelectors
		ifTrue: [^ self xLetter].
	^ self xIllegal