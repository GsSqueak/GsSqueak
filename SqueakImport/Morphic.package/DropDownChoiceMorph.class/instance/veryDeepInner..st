copying
veryDeepInner: deepCopier
	super veryDeepInner: deepCopier.
	items := items veryDeepCopyWith: deepCopier.
	border := border veryDeepCopyWith: deepCopier