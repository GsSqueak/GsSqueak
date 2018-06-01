private
argumentNamed: argName
	^self
		detect: [:each | each key = argName]
		ifNone: [nil]