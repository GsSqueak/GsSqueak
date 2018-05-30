initialize-release
setSelector: aSymbol
	"Make the receiver point at the given selector, in the currently chosen class. If the selector is found in the class organization we also set the message category to suit"

	| aClass |
	aSymbol ifNil: [^ self].
	(aClass := self selectedClassOrMetaClass) ifNil: [^ self].
	(aClass organization categoryOfElement: aSymbol)
		ifNil: [^ self]
		ifNotNil: [:category |
			self
				selectMessageCategoryNamed: category;
				selectMessageNamed: aSymbol].