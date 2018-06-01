stepping and presenter
step

	super step.
	somethingChanged ifFalse: [^self].
	self fixup.
