copying
veryDeepInner: deepCopier
	super veryDeepInner: deepCopier.
	messageList := messageList veryDeepCopyWith: deepCopier.
	editSelection := editSelection veryDeepCopyWith: deepCopier.