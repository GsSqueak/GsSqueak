initialization
on: anObject list: listSel primarySelection: getSelectionSel changePrimarySelection: setSelectionSel listSelection: getListSel changeListSelection: setListSel menu: getMenuSel keystroke: keyActionSel
	"setup a whole load of pluggability options"
	getSelectionListSelector := getListSel.
	setSelectionListSelector := setListSel.
	super on: anObject list: listSel selected: getSelectionSel changeSelected: setSelectionSel menu: getMenuSel keystroke: keyActionSel
