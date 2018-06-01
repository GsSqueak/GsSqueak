stepping and presenter
step
	| s |
	super step.
	s := self readFromTarget.
	s = contents ifFalse:
		[self contents: s.
		self color: s]
