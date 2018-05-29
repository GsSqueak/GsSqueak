context stack menu
shiftedContextStackMenu: aMenu
	"Set up the menu appropriately for the context-stack-list, shifted"
	<contextStackMenuShifted: true>
	^ aMenu addList: #(
			('browse class hierarchy'				classHierarchy)
			('browse class'							browseClass)
			('implementors of sent messages'		browseAllMessages)
			('change sets with this method'			findMethodInChangeSets)
			-	
			('inspect instances'						inspectInstances)
			('inspect subinstances'					inspectSubInstances)
			-	
			('revert to previous version'			revertToPreviousVersion)
			('remove from current change set'		removeFromCurrentChanges)
			('revert & remove from changes'		revertAndForget));
		yourself
