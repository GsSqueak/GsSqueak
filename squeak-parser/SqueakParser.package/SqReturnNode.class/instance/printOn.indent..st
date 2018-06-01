printing
printOn: aStream indent: level 
	aStream nextPutAll: '^ '.
	"make this a preference??"
	expr printOn: aStream indent: level.
	expr printCommentOn: aStream indent: level