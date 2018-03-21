annotation
classCommentText
	"return the text to display for the comment of the currently selected class"
	| theClass comment |
	theClass := self selectedClassOrMetaClass.
	theClass ifNil: [ ^''].

	^ (comment := theClass comment) isEmptyOrNil
		ifTrue: [ self noCommentNagString ]
		ifFalse: [comment]