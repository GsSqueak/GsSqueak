message functions
mainMessageListMenu: aMenu
	"Answer the message-list menu"
	<messageListMenuShifted: false>
	aMenu addList: #(
			('what to show...'			offerWhatToShowMenu)
			('toggle break on entry'		toggleBreakOnEntry)
			-
			('browse full (b)' 			browseMethodFull)
			('browse hierarchy (h)'			classHierarchy)
			('browse protocol (p)'			browseFullProtocol)
			-
			('fileOut'				fileOutMessage)
			('printOut'				printOutMessage)
			('copy selector (c)'		copySelector)
			('copy reference (C)'	copyReference)
			-
			('senders of... (n)'			browseSendersOfMessages)
			('implementors of... (m)'		browseMessages)
			('inheritance (i)'			methodHierarchy)
			('versions (v)'				browseVersions)
			-
			('references... (r)'			browseVariableReferences)
			('assignments... (a)'			browseVariableAssignments)
			('class refs (N)'			browseClassRefs)
			-
			('remove method (x)'			removeMessage)
			('explore method'			exploreMethod)
			('inspect method'			inspectMethod)).
	^ aMenu