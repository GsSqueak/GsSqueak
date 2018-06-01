contents
contents: input notifying: aController 
	| selector |
	(selector := methodClass newParser parseSelector: input asText) ifNil:
		[self inform: 'Sorry - invalid format for the 
method name and arguments -- cannot accept.'.
		^ false].

	selector == methodSelector ifFalse:
		[self inform:
'You cannot change the name of
the method here -- it must continue
to be ', methodSelector.
		^ false].

	selector := methodClass
				compile: input asText
				classified: self selectedMessageCategoryName
				notifying: aController.
	selector == nil ifTrue: [^ false].
	contents := input asString copy.
	currentCompiledMethod := methodClass compiledMethodAt: methodSelector.
	^ true