identification
authorInitials
	"Answer the initials to be used to identify the current code author.  "

	[AuthorInitials isEmpty] whileTrue: [self setAuthorInitials].
	^ AuthorInitials