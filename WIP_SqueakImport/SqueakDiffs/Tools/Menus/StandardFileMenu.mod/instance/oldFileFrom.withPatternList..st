private
oldFileFrom: aDirectory withPatternList: aPatternList

	canTypeFileName := false.
	pattern := aPatternList.
	^self makeFileMenuFor: aDirectory