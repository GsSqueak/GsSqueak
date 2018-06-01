adding
addAllFirstTo: anOrderedCollection
	"Add all of my elements to the beginning of anOrderedCollection"

	self do: [ :each | anOrderedCollection addFirst: each ]