contents
contents: input notifying: aController

	| aString |
	aString := input asString.
	(#(classDefinition newClass) includes: self editSelection)
		ifTrue: [^ self defineClass: aString notifying: aController].
	self editSelection == #classComment ifTrue: [
		self hasClassSelected ifFalse: [^ false].
		self selectedClass comment: input.
		^ true].
	self editSelection == #classHierarchy ifTrue: [^ true].
	self editSelection == #editMessage | (self editSelection == #newMessage)
		ifTrue:
			[^ self okayToAccept
				ifFalse: [false]
				ifTrue: [self compileMethod: aString notifying: aController]].
	self editSelection == #none
		ifTrue: [self inform: 'This text cannot be accepted
in this part of the browser.'.
			^ false].
	self error: 'unacceptable accept'