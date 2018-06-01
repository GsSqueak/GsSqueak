accessing
saveMorph: aMorph author: authorString
	"Save the given morph as this page's contents. Update its thumbnail and inform references to this URL that the page has changed."
	"Details: updateThumbnail releases the cached state of the saved page contents after computing the thumbnail."

	| n |
	contentsMorph := aMorph.
	n := aMorph knownName.
	n ifNotNil: [self title: n].
	creationAuthor ifNil: [
		creationAuthor := authorString.
		creationTime := Time totalSeconds].
"	lastChangeAuthor := authorString.
	lastChangeTime := Time totalSeconds.	do it when actually write"
	self computeThumbnail.
	self postChangeNotification.
