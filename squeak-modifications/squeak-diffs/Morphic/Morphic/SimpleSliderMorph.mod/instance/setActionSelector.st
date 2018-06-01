menu
setActionSelector
	| oldSel newSel |
	oldSel := setValueSelector isNil ifTrue: [''] ifFalse: [setValueSelector].
	newSel := UIManager default 
				request: 'Please type the selector to be sent to
the target when this slider is changed' translated
				initialAnswer: oldSel.
	newSel isEmpty ifFalse: [self actionSelector: newSel]