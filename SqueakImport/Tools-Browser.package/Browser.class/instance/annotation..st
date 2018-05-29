annotation
annotation: aText 
	"The user accepted aText in our annotation pane"
	| theClass |
	(theClass := self selectedClass) ifNil: [^false].
	self editSelection == #editClass
		ifTrue: [
			self stripNaggingAttributeFromComment: aText.
			theClass comment: aText stamp: Utilities changeStamp.
			self changed: #classCommentText.
			^ true].
	^ false
