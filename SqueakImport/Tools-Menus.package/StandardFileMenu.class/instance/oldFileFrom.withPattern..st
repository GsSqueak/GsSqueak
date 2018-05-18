private
oldFileFrom: aDirectory withPattern: aPattern

	canTypeFileName := false.
	pattern := {aPattern}.
	^self makeFileMenuFor: aDirectory