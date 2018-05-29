as yet unclassified
doPageFlip
	"Flip to this page"

	self objectsInMemory.
	bookMorph ifNil: [^ self].
	bookMorph goToPageMorph: page
			transitionSpec: (self valueOfProperty: #transitionSpec).
	(owner isKindOf: PasteUpMorph) ifTrue:
		[owner cursor: (owner submorphs indexOf: self ifAbsent: [1])]