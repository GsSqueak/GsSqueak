initialization
initialize
	super initialize.
	self color: Color black.
	font := Preferences standardListFont.
	listItems := #().
	listIcons := #().
	listFilterOffsets := #().
	selectedRow := nil.
	selectedRows := PluggableSet integerSet.
	preSelectedRow := nil.
	self adjustHeight.