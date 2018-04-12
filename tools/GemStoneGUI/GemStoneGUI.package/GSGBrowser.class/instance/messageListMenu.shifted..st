message list
messageListMenu: aMenu shifted: shifted

	^ aMenu addList: #(
			('senders of... (n)'			browseSenders)
			('implementors of... (m)'	browseImplementors)
			('inheritance (i)'			browseInheritance)
			-
			('references... (r)'			browseVariableReferences)
			('assignments... (a)'		browseVariableAssignments)
			('class refs (N)'				browseClassReferences)
			-
			('remove method (x)'		removeMessage));
		yourself