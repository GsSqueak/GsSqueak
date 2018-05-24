list management
listChanged
	"set newList to be the list of strings to display"
	| size |
	size := self getListSize.
	listItems := Array new: size withAll: nil.
	listIcons := Array new: size withAll: nil.
	listFilterOffsets := Array new: size withAll: nil.
	maxWidth := nil.
	selectedRow := nil.
	selectedRows := PluggableSet integerSet.
	preSelectedRow := nil.
	self adjustHeight.
	self adjustWidth.
	self changed.
