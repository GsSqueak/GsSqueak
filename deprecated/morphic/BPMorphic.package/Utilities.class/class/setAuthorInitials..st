identification
setAuthorInitials: aString 
	AuthorInitials := aString.
	"Case of being reset due to, eg, copy of image."
	aString isEmpty
		ifTrue: [AuthorName := '']