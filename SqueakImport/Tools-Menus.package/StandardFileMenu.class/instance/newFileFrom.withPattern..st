private
newFileFrom: aDirectory withPattern: aPattern

	canTypeFileName := true.
	pattern := {aPattern}.
	^self makeFileMenuFor: aDirectory