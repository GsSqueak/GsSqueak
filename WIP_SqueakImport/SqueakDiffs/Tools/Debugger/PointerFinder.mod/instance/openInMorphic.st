morphic ui
openInMorphic
	| window list |
	window := (SystemWindow labelled: 'Pointer Finder')
		model: self.
	list := PluggableListMorph new
		doubleClickSelector: #inspectObject;

		on: self
		list: #pointerList
		selected: #pointerListIndex
		changeSelected: #pointerListIndex:
		menu: #menu:shifted:
		keystroke: #arrowKey:from:.
		"For doubleClick to work best disable autoDeselect"
		list autoDeselect: false.
	window addMorph: list frame: (0@0 extent: 1@1).
	list color: Color lightMagenta.
	window openInWorld