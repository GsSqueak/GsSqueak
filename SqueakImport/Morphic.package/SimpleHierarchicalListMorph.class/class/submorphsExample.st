examples
submorphsExample
	"display a hierarchical list of the current world plus its submorphs plus its submorphs' submorphs etc."
	"SimpleHierarchicalListMorph submorphsExample"
	| morph |
	morph :=
		SimpleHierarchicalListMorph
			on: [ Array with:  (MorphWithSubmorphsWrapper with: Project current world)  ]
			list: #value
			selected: nil
			changeSelected: nil
			menu: nil
			keystroke: nil.

	morph openInWindow