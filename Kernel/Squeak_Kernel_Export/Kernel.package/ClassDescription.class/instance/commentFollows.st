fileIn/Out
commentFollows 
	"Answer a ClassCommentReader who will scan in the comment."

	^ ClassCommentReader new setClass: self category: #Comment

	"False commentFollows inspect"