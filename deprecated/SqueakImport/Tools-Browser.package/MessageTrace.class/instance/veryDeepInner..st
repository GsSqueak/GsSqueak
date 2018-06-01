copying
veryDeepInner: aDeepCopier 
	super veryDeepInner: aDeepCopier.
	autoSelectStrings := autoSelectStrings veryDeepCopyWith: aDeepCopier.
	messageSelections := messageSelections veryDeepCopyWith: aDeepCopier