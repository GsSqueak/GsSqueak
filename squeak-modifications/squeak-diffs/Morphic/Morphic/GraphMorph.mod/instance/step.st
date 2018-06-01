stepping and presenter
step
	"Make a deferred damage rectangle if I've changed. This allows applications to call methods that invalidate my display at high-bandwidth without paying the cost of doing the damage reporting on ever call; they can merely set hasChanged to true."

	super step.
	hasChanged isNil ifTrue: [hasChanged := false].
	hasChanged 
		ifTrue: 
			[self changed.
			hasChanged := false]