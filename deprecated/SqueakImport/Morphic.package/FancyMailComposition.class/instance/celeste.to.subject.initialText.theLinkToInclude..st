initialization
celeste: aCeleste to: argTo subject: argSubject initialText: aText theLinkToInclude: linkText 
 "self new celeste: Celeste current to: 'danielv@netvision.net.il' subject: 'Mysubj' initialText: 'atext' theLinkToInclude: 'linkText'"

	to := argTo.
	subject := argSubject.
	messageText := aText.
	theLinkToInclude := linkText.
	textFields := #().
