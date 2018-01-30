die rolling
check: nDice difficulty: diff
	"Roll some dice, WoD-style."

	| result |
	result := 0.
	nDice timesRepeat: 
		[ | die |
		(die := self nextInt: 10) = 1
			ifTrue: [result := result - 1]
			ifFalse: [die >= diff ifTrue: [result := result + 1]]].
	^ result