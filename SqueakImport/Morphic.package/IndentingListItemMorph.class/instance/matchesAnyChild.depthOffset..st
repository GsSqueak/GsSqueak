filtering
matchesAnyChild: pattern depthOffset: offset

	| maxDepth next current |
	maxDepth := PluggableTreeMorph maximumSearchDepth - self indentLevel + offset.
	maxDepth <= 0 ifTrue: [^ false].
	
	next := (self getChildren collect: [:obj | 1 -> obj]) asOrderedCollection.
	[next notEmpty] whileTrue: [
		current := next removeFirst.
		
		(self matches: pattern in: current value)
			ifTrue: [^ true].
		
		current key < maxDepth ifTrue: [
			next addAll: ((self getChildrenFor: current value) collect: [:obj | (current key + 1) -> obj])].
		].
	
	^ false