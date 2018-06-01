class comment pane
annotationForClassCommentFor: aClass
	"Provide a line of content for an annotation pane, given that the receiver is pointing at the class comment of the given class."
	| aStamp |
	aStamp :=  classOrganizer commentStamp.
	^ aStamp
		ifNil:
			[self selectedClassName, ' has no class comment']
		ifNotNil:
			['class comment for ', self selectedClassName,
				(aStamp = '<historical>'
					ifFalse:
						[' - ', aStamp]
					ifTrue:
						[''])]