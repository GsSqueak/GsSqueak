message category list
messageCategoryListKey: aCharacter from: view

	aCharacter == $x ifTrue: [ ^self removeMessageCategory ].
	^self arrowKey: aCharacter from: view
	