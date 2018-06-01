fileIn/Out
checkForUncommentedClasses
	"Check to see if any classes involved in this change set do not have class comments.  Open up a browser showing all such classes."

	| aList |
	aList := self changedClasses
		select:
			[:aClass | aClass theNonMetaClass organization classComment isEmptyOrNil]
		thenCollect:
			[:aClass  | aClass theNonMetaClass name].

	aList size > 0
		ifFalse:
			[^ self inform: 'All classes involved in this change set have class comments']
		ifTrue:
			[ToolSet openClassListBrowser: aList asSet sorted title: 'Classes in Change Set ', self name, ': classes that lack class comments']