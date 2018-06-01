emphasis
onlyBoldItem: itemNumber
	"Set up emphasis such that all items are plain except for the given item number.  "

	emphases := (Array new: selections size) atAllPut: #normal.
	emphases at: itemNumber put: #bold