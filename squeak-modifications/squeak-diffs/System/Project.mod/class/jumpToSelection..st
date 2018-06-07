utilities
jumpToSelection: selection
	"Enter the project corresponding to this menu selection."

	self flag: #toRemove. "Project current jumpToProject"
	^ self current jumpToSelection: selection
