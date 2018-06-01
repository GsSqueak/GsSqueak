accessing
separators
	"return a set containing just the whitespace characters"
	^ Separators
		ifNil: [Separators := self newFrom: Character separators]