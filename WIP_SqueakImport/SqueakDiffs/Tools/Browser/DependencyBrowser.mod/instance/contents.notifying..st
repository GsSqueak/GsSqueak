contents
contents: input notifying: aController 
	"The retrieved information has changed and its source must now be
	 updated. The information can be a variety of things, depending on
	 the list selections (such as templates for class or message definition,
	 methods) or the user menu commands (such as definition, comment,
	 hierarchy).  Answer the result of updating the source."

	| aString aText theClass theMethodName |
	self changed: #annotation.
	aString := input asString.
	aText := input asText.
	
	theClass := self selectedClassOrMetaClass.
	theMethodName := self selectedMessageName.
	(theClass notNil and: [theMethodName notNil]) ifTrue: [
		^ self okayToAccept
				ifFalse:
					[false]
				ifTrue:
					[self defineMessageFrom: aText notifying: aController]].
	self error: 'unacceptable accept'
