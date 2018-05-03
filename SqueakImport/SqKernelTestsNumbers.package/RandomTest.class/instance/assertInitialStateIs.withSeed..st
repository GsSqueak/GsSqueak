helpers
assertInitialStateIs: expectedInitialState withSeed: seed
	"Verify that the initial values of the states variable match the given values for the given seed."

	| random |
	random := Random basicNew.
	random initializeStatesWith: seed.
	self
		assert: expectedInitialState
		equals: (random instVarNamed: #states)