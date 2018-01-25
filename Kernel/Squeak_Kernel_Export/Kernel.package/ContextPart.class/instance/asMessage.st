converting
asMessage
	| selector args |
	selector := sender method selector.
	args := Array new: selector numArgs.
	1 to: selector numArgs do: [ :i | args at: i put: (sender tempAt: i)].
	^ Message selector: selector arguments: args.