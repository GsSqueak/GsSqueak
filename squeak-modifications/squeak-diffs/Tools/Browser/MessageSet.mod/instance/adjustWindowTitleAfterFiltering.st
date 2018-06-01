private
adjustWindowTitleAfterFiltering
	"Set the title of the receiver's window, if any, to reflect the just-completed filtering"

	| aWindow existingLabel newLabel |

	(aWindow := self containingWindow) ifNil: [^ self].
	(existingLabel := aWindow label) isEmptyOrNil ifTrue: [^ self].
	(((existingLabel size < 3) or: [existingLabel last ~~ $]]) or: [(existingLabel at: (existingLabel size - 1)) isDigit not]) ifTrue: [^ self].
	existingLabel size to: 1 by: -1 do:
		[:anIndex | ((existingLabel at: anIndex) == $[) ifTrue:
			[newLabel := (existingLabel copyFrom: 1 to: anIndex),
				'Filtered: ',
				messageList size printString,
				']'.
			^ aWindow setLabel: newLabel]]
			

