message category functions
addCategory
	"Present a choice of categories or prompt for a new category name and add it before the current selection, or at the end if no current selection"
	| labels reject lines newName oldCategory |
	self okToChange ifFalse: [^ self].
	self hasClassSelected ifFalse: [^ self].
	labels := OrderedCollection new.
	reject := Set new.
	reject
		addAll: self selectedClassOrMetaClass organization categories;
		add: ClassOrganizer nullCategory;
		add: ClassOrganizer default.
	lines := OrderedCollection new.
	self selectedClassOrMetaClass allSuperclasses do: [:cls | | cats |
		cls = Object ifFalse: [
			cats := cls organization categories reject:
				 [:cat | reject includes: cat].
			cats isEmpty ifFalse: [
				lines add: labels size.
				labels addAll: cats sort.
				reject addAll: cats]]].
	(newName := UIManager default
		chooseFromOrAddTo: labels
		lines: lines
		title: 'Add Category') ifNil: [^ self].
	newName isEmpty
		ifTrue: [^ self]
		ifFalse: [newName := newName asSymbol].
	oldCategory := self selectedMessageCategoryName.
	self classOrMetaClassOrganizer
		addCategory: newName
		before: (self hasMessageCategorySelected
				ifFalse: [nil]
				ifTrue: [self selectedMessageCategoryName]).
	self changed: #messageCategoryList.
	self selectMessageCategoryNamed: newName.
	self changed: #messageCategoryList.
