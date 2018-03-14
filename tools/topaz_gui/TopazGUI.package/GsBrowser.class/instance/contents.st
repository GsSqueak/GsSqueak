contents
contents
	"Depending on the current selection, different information is retrieved.
	Answer a string description of that information. This information is the
	method of the currently selected class and message."

	| comment latestCompiledMethod |
	latestCompiledMethod := currentCompiledMethod.
	currentCompiledMethod := nil.

	editSelection == #none ifTrue: [^ ''].
	editSelection == #newClass 
		ifTrue: [^ self newClassContents].
	editSelection == #editClass 
		ifTrue: [^self classDefinitionText].
	editSelection == #editComment 
		ifTrue:
			[self selectedClassName ifNil: [^ ''].
			comment := self topazProxy commentFor: self selectedClassName.
			"currentCompiledMethod := classOrganizer commentRemoteStr."
			^ comment size = 0
				ifTrue: ['This class has not yet been commented.']
				ifFalse: [comment]].
	editSelection == #newMessage
		ifTrue: [^ self sourceCodeTemplate].
	editSelection == #editMessage
		ifTrue:
			[^ self editContentsWithDefault:
				[currentCompiledMethod := latestCompiledMethod.
				self selectedMessage]].
		
	^ ''