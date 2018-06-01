class functions
classListMenu: aMenu 
	"Conveniently fit for backward compatibility with old browers stored in image segments"
	<classListMenuShifted: false>
	aMenu addList: #(
		-
		('browse full (b)'			browseMethodFull)
		('browse hierarchy (h)'		spawnHierarchy)
		('browse protocol (p)'		browseFullProtocol)
		-
		('printOut'					printOutClass)
		('fileOut'					fileOutClass)
		-
		('show hierarchy'			hierarchy)
		('show definition'			editClass)
		('show comment'			editComment)
		('show all comments'		browseAllCommentsForClass)
		-
		('references... (r)'			browseVariableReferences)
		('assignments... (a)'			browseVariableAssignments)
		('class refs (N)'				browseClassRefs)
		-
		('rename class ...'			renameClass)
		('copy class'				copyClass)
		('remove class (x)'			removeClass)
		-
		('find method...'				findMethod)).
	^ aMenu
