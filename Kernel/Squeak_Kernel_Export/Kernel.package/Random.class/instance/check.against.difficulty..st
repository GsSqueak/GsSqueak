die rolling
check: nAttack against: nDefend difficulty: diff
	"Roll some dice, WoD-style."

	| attacks defends |
	attacks := self check: nAttack difficulty: diff.
	attacks < 0 ifTrue: [^ attacks].
	defends := self check: nDefend difficulty: diff.
	^ attacks - defends min: 0