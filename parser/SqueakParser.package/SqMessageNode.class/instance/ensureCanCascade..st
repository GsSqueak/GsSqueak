cascading
ensureCanCascade: encoder 
	special > 0
		ifTrue: [special := 0.
			receiver := originalReceiver.
			selector := encoder encodeSelector: originalSelector.
			arguments := originalArguments.
			receiver isBlockNode
				ifTrue: [receiver deoptimize].
			arguments
				do: [:each | each isBlockNode
						ifTrue: [each deoptimize]]]