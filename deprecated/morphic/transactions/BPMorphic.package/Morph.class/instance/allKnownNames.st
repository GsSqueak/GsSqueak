submorphs-accessing
allKnownNames
	"Return a list of all known names based on the scope of the receiver.
	Does not include the name of the receiver itself. Items in parts bins
	are excluded. Reimplementors (q.v.) can extend the list"
	^ Array
		streamContents: [:s | self
				allSubmorphNamesDo: [:n | s nextPut: n]]