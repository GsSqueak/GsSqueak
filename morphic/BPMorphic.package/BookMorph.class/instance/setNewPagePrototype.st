menu
setNewPagePrototype
	"Record the current page as the prototype to be copied when inserting
	new pages."
	currentPage
		ifNotNil: [newPagePrototype := currentPage veryDeepCopy.
			newPagePrototype removeProperty: #revertKey]