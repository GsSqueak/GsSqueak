world menu
deleteNonWindows
	(UIManager default confirm:
'Do you really want to discard all objects
that are not in windows?' translated)
		ifFalse: [^ self].

	self allNonFlapRelatedSubmorphs do:
		[:m | m delete]