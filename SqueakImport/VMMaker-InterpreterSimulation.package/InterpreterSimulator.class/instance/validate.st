testing
validate
	| oop prev |
	transcript show: 'Validating...'.
	oop := objectMemory firstObject.
	[oop < objectMemory getEndOfMemory] whileTrue: [
		self validate: oop.
		prev := oop.  "look here if debugging prev obj overlapping this one"
		oop := objectMemory objectAfter: oop.
	].
	prev := prev.  "Don't offer to delete this please"
	transcript show: 'done.'; cr