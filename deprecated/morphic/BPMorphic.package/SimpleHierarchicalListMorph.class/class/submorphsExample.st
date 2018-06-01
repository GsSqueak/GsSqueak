examples
submorphsExample
	"display a hierarchical list of the World plus its submorphs plus its
	submorphs' submorphs etc."
	"[SimpleHierarchicalListMorph submorphsExample]"
	| _gsSqueakTemp_morph |
	_gsSqueakTemp_morph := SimpleHierarchicalListMorph
				on: [Array
						with: (MorphWithSubmorphsWrapper with: World)]
				list: #value
				selected: nil
				changeSelected: nil
				menu: nil
				keystroke: nil.
	_gsSqueakTemp_morph openInWindow