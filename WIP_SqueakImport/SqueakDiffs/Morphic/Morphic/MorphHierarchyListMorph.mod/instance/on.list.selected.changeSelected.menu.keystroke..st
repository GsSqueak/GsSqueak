initialization
on: anObject list: getListSel selected: getSelectionSel changeSelected: setSelectionSel menu: getMenuSel keystroke: keyActionSel 
	super
		on: anObject
		list: getListSel
		selected: getSelectionSel
		changeSelected: setSelectionSel
		menu: getMenuSel
		keystroke: keyActionSel.
	""
	self borderWidth: 0.
	self autoDeselect: false.
	self enableDrag: false.
	self enableDrop: true.
	self hResizing: #spaceFill.
	self vResizing: #spaceFill.
self expandRoots