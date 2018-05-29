contents
defineMessageFrom: aString notifying: aController
	"Compile the expressions in aString. Notify aController if a syntax error occurs. Install the compiled method in the selected class classified under  the currently selected message category name. Answer the selector obtained if compilation succeeds, nil otherwise."
	| selectedMessageName selector category oldMessageList |
	selectedMessageName := self selectedMessageName.
	oldMessageList := self messageList.
	contents := nil.
	selector := (self selectedClassOrMetaClass newParser parseSelector: aString).
	selector := self selectedClassOrMetaClass
				compile: aString
				classified: (category := self selectedMessageCategoryName)
				notifying: aController.
	selector == nil ifTrue: [^ false].
	contents := aString copy.
	^ true
