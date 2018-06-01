helpers
assertFirstValuesAre: expectedValues finalStatesAre: expectedFinalStates withSeed: seed
	"Verify that the first generated numbers with the given seed are the same as in expectedValues. Also check that the state of the generator matches expectedFinalStates after the last number was generated."

	| random states |
	random := Random seed: seed.
	expectedValues do: [ :each |
		self assert: each equals: random nextValue ].
	states := random instVarNamed: #states.
	self
		assert: expectedFinalStates
		equals: states.
	self
		assert: expectedValues size \\ states size + 1
		equals: (random instVarNamed: #index)
