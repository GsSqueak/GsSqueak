adding
addAllFirstTo: anOrderedCollection
	"Add all of my elements to the beginning of anOrderedCollection"

	self reverseDo: [ :each | anOrderedCollection addFirst: each ]
