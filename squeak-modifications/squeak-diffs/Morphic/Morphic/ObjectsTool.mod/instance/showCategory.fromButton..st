categories
showCategory: aCategoryName fromButton: aButton 
	"Project items from the given category into my lower pane"

	"self partsBin removeAllMorphs. IMHO is redundant, "
	Cursor wait
		showWhile: [
			| quads |
			quads := OrderedCollection new.
			Morph withAllSubclasses
				do: [:aClass | aClass theNonMetaClass
						addPartsDescriptorQuadsTo: quads
						if: [:aDescription | aDescription translatedCategories includes: aCategoryName]].
			quads sort: [:q1 :q2 | q1 third <= q2 third].
			self installQuads: quads fromButton: aButton]