testing
allSketchMorphForms
	"Answer a Set of forms of SketchMorph (sub) instances, except those 
	used as button images, ones being edited, and those with 0 extent."

	| reasonableForms |
	reasonableForms := Set new.
	Morph allSketchMorphClasses do:
		[:cls | cls allInstances do:
			[:m | | form |
			(m owner isKindOf: SketchEditorMorph orOf: IconicButton)
				ifFalse:
					[form := m form.
					((form width > 0) and: [form height > 0]) ifTrue: [reasonableForms add: form]]]].
	^ reasonableForms