private
newFileFrom: aDirectory withPatternList: aPatternList

	canTypeFileName := true.
	pattern := aPatternList.
	^self makeFileMenuFor: aDirectory