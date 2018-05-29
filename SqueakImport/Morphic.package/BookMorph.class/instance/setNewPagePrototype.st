menu
setNewPagePrototype
	"Record the current page as the prototype to be copied when inserting new pages."

	currentPage ifNotNil:
		[newPagePrototype := currentPage veryDeepCopy.
		 newPagePrototype removeProperty: #revertKey].
		"When a new page is inserted, it will not have any original page to revert to.  After author improves the new page, he can save it for later revert."
