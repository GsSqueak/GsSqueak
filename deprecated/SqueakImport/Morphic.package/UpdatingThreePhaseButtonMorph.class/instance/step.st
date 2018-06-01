stepping and presenter
step
	| newBoolean |
	super step.
	state == #pressed ifTrue: [^ self].
	newBoolean := target perform: getSelector.
	newBoolean == self isOn
		ifFalse:
			[self state: (newBoolean == true ifTrue: [#on] ifFalse: [#off])]