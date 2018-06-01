printing
printWithClosureAnalysisOn: aStream indent: level 
	aStream nextPutAll: '^ '.
	"make this a preference??"
	expr printWithClosureAnalysisOn: aStream indent: level.
	expr printCommentOn: aStream indent: level