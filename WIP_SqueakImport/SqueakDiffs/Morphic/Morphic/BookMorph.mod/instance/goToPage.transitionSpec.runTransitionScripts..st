navigation
goToPage: pageNumber transitionSpec: transitionSpec runTransitionScripts: aBoolean
	"Go the the given page number; use the transitionSpec supplied, and if the boolean parameter is true, run opening and closing scripts as appropriate"

	| pageMorph |
	pages isEmpty ifTrue: [^ self].
	pageMorph := (self hasProperty: #dontWrapAtEnd)
		ifTrue: [pages atPin: pageNumber]
		ifFalse: [pages atWrap: pageNumber].
	^ self goToPageMorph: pageMorph transitionSpec: transitionSpec runTransitionScripts: aBoolean