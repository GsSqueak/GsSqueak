deserialization
deserializeComposite: aStream

	| elements |
	self assert: aStream next = $[.
	(aStream peekFor: $])
		ifTrue: [	elements := Array new]
		ifFalse: [
			elements := OrderedCollection new.
			[elements add: (self deserialize: aStream)]
				doWhileTrue: [aStream next ~= $]]].
	^ aStream peek = $(
		ifFalse: [elements asArray]
		ifTrue: [
			| targetClass |
			self assert: aStream next = $(.
			targetClass := Smalltalk at: (aStream upTo: $)) asSymbol.
			targetClass deserializeFrom: elements asArray]
	