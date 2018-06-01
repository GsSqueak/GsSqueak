initialization
initialize
	super initialize.

	bounds := 0 @ 0 corner: 40 @ 10.

	self setDefaultParameters.

	self changeTableLayout.
	self listDirection: #topToBottom.
	self hResizing: #shrinkWrap.
	self vResizing: #shrinkWrap.
	defaultTarget := nil.
	selectedItem := nil.
	stayUp := false.
	popUpOwner := nil.