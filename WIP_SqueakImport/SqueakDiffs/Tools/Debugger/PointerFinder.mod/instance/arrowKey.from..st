pointer-list
arrowKey: key from: aController
	key = $i ifTrue: [^ self inspectObject].
	^ super arrowKey: key from: aController