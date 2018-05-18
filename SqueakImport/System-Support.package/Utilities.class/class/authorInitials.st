identification
authorInitials
	"Answer the initials to be used to identify the current code author.  "
	"Hack"

	AuthorInitials ifNil: [self setAuthorInitials: 'GSSqueak'].
	AuthorInitials ifEmpty: [self setAuthorInitials: 'GSSqueak'].
	^ AuthorInitials
