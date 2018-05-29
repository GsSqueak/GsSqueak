navigation
goToPage: pageNumber transitionSpec: transitionSpec

	| pageMorph |
	pages isEmpty ifTrue: [^ self].
	pageMorph := (self hasProperty: #dontWrapAtEnd)
		ifTrue: [pages atPin: pageNumber]
		ifFalse: [pages atWrap: pageNumber].
	^ self goToPageMorph: pageMorph transitionSpec: transitionSpec