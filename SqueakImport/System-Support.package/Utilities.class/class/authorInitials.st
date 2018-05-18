identification
authorInitials
	"Answer the initials to be used to identify the current code author.  "
	"Hack"

	[AuthorInitials isEmpty] whileTrue: [self setAuthorInitials: 'GSSqueak'].
	^ AuthorInitials
