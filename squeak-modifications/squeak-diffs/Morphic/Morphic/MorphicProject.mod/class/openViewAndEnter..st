instance creation
openViewAndEnter: morphOrList
	"morphOrList has been reconstituted from a file. Open it in an appropriate
	Morphic world."

	| contents |
	contents := morphOrList.
	(morphOrList isKindOf: SqueakPage) ifTrue: [
		contents := morphOrList contentsMorph
	].
	(contents isKindOf: PasteUpMorph) ifFalse:
		[^ self inform: 'This is not a PasteUpMorph or
exported Project.' translated].
	(self openViewOn: contents) enter
