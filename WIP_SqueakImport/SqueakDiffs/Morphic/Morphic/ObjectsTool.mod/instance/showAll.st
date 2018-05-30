search
showAll
	"Put items matching the search string into my lower pane.
	showAll is for testing that all bin parts can be displayed.
	Currently it has no callers of use other than the test."
	| quads |
	self partsBin removeAllMorphs.
	self modeSymbol: nil .
	Cursor wait
		showWhile: [quads := OrderedCollection new.
			Morph withAllSubclasses
				do: [:aClass | aClass
						addPartsDescriptorQuadsTo: quads
						if: [:info | true ]].
			self installQuads: quads fromButton: nil]