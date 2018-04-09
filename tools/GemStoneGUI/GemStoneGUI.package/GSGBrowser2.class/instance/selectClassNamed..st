class list
selectClassNamed: aSymbolOrString

	| name classNames |
	name := aSymbolOrString ifNotNil: [:string | string asSymbol].
	classNames := self classList collect: [:class | class withoutLeadingBlanks].
	selectedClassName := (classNames includes: name)
		ifTrue: [name asSymbol]
		ifFalse: [nil].
	self hasClassSelected
		ifTrue: [self editSelection: #classDefinition]
		ifFalse: [self editSelection: #newClass].
	self invalidateMessageCategoryDict.
	self changed: #classListIndex.
	self changed: #relabel