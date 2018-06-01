system category functions
renameSystemCategory
	"Prompt for a new category name and add it before the
	current selection, or at the end if no current selection"
	| oldSelection newName |
	oldSelection := self selectedSystemCategory.
	oldSelection isNil
		ifTrue: [^ self].  "no selection"
	self okToChange ifFalse: [^ self].
	
	newName := self
		request: 'Please type new category name'
		initialAnswer: oldSelection.
	newName isEmpty
		ifTrue: [^ self]
		ifFalse: [newName := newName asSymbol].
	oldSelection = newName ifTrue: [^ self].
	systemOrganizer
		renameCategory: oldSelection
		toBe: newName.
	self selectSystemCategory: newName.
	self changed: #systemCategoryList.