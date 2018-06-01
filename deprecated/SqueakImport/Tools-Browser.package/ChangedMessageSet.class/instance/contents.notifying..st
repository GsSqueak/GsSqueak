acceptance
contents: aString notifying: aController
	"Accept the string as new source for the current method, and make certain the annotation pane gets invalidated"

	| existingSelector existingClass superResult newSelector |
	existingSelector := self selectedMessageName.
	existingClass := self selectedClassOrMetaClass.

	superResult := super contents: aString notifying: aController.
	superResult ifTrue:  "succeeded"
		[newSelector := existingClass newParser parseSelector: aString.
		newSelector ~= existingSelector
			ifTrue:   "Selector changed -- maybe an addition"
				[self reformulateList.
				self changed: #messageList.
				self messageList doWithIndex:
					[:aMethodReference :anIndex |
						(aMethodReference actualClass == existingClass and:
									[aMethodReference methodSymbol == newSelector])
							ifTrue:
								[self messageListIndex: anIndex]]]].
	^ superResult