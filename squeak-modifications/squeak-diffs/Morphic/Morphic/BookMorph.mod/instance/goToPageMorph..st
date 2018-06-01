navigation
goToPageMorph: aMorph
	"Set the given morph as the current page; run closing and opening scripts as appropriate"

	self goToPageMorph: aMorph runTransitionScripts: true