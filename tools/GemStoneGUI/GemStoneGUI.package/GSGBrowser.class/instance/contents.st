contents
contents
	"Depending on the current selection, different information is retrieved.
	Answer a string description of that information. This information is the
	method of the currently selected class and message."

	| comment theClass latestCompiledMethod |
	latestCompiledMethod := currentCompiledMethod.
	currentCompiledMethod := nil.

	editSelection == #newTrait
		ifTrue: [^ClassDescription newTraitTemplateIn: self selectedSystemCategory].
	editSelection == #none ifTrue: [^ ''].
	editSelection == #editSystemCategories 
		ifTrue: [^ systemOrganizer printString].
	editSelection == #newClass 
		ifTrue: [^ self newClassContents].
	editSelection == #editClass 
		ifTrue: [^self classDefinitionText].
	editSelection == #editComment 
		ifTrue:
			[(theClass := self selectedClass) ifNil: [^ ''].
			comment := theClass comment.
			currentCompiledMethod := classOrganizer commentRemoteStr.
			^ comment size = 0
				ifTrue: ['This class has not yet been commented.']
				ifFalse: [comment]].
	editSelection == #hierarchy 
		ifTrue: [^self selectedClassOrMetaClass printHierarchyForEnv: self envId].
	editSelection == #editMessageCategories 
		ifTrue: [^ self classOrMetaClassOrganizer printString].
	editSelection == #newMessage
		ifTrue:
			[^ (theClass := self selectedClassOrMetaClass) 
				ifNil: ['']
				ifNotNil: [theClass sourceCodeTemplate]].
	editSelection == #editMessage
		ifTrue:
			[^ self editContentsWithDefault:
				[currentCompiledMethod := latestCompiledMethod.
				self selectedMessage]].

	self error: 'Browser internal error: unknown edit selection.'