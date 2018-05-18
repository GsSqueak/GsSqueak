fileIn/Out
fileIn
	"Guarantee that the receiver is readOnly before fileIn for efficiency and
	to eliminate remote sharing conflicts."

	self readOnly.
	self fileInAnnouncing: 'Loading ', self localName