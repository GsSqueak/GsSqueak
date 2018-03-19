contents
defineMessageFrom: aString notifying: aController
	"Compile the expressions in aString. Notify aController if a syntax error occurs. Install the compiled method in the selected class classified under  the currently selected message category name. Answer the selector obtained if compilation succeeds, nil otherwise."
	| selectedMessageName selector category oldMessageList selectedClassOrMetaClass |
	selectedMessageName := self selectedMessageName.
	oldMessageList := self messageList.
	selectedClassOrMetaClass := self selectedClassOrMetaClass.
	contents := nil.
	category := selectedMessageName
		ifNil: [self selectedMessageCategoryName]
		ifNotNil: [selectedClassOrMetaClass whichCategoryIncludesSelector: selectedMessageName].
	category ifNil: [category := ClassOrganizer default].
	selector := selectedClassOrMetaClass
				compile: aString
				classified: category
				env: self envId
				notifying: aController.
	selector == nil ifTrue: [^ nil].
	contents := aString copy.
	selector ~~ selectedMessageName
		ifTrue: 
			[category = ClassOrganizer nullCategory
				ifTrue: [self changed: #classSelectionChanged.
						self changed: #classList.
						self messageCategoryListIndex: 1].
			self setClassOrganizer.  "In case organization not cached"
			(oldMessageList includes: selector)
				ifFalse: [self changed: #messageList].
			self messageListIndex: (self messageList indexOf: selector)].
	^ selector
