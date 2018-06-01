submorph access
showAlphabeticCategory: aString fromButton: aButton 
	"Blast items beginning with a given letter into my lower pane"
	self partsBin removeAllMorphs.
	Cursor wait
		showWhile: [
			| eligibleClasses quads uc |
			uc := aString asUppercase asCharacter.
			eligibleClasses := Morph withAllSubclasses.
			quads := OrderedCollection new.
			eligibleClasses
				do: [:aClass | aClass theNonMetaClass
						addPartsDescriptorQuadsTo: quads
						if: [:info | info formalName translated asUppercase first = uc]].
			self installQuads: quads fromButton: aButton]