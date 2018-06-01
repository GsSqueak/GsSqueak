layout
layoutChanged
	"Update rotatedForm and compute new bounds."
	self changed.
	self generateRotatedForm.
	bounds := bounds origin extent: rotatedForm extent.
	super layoutChanged.
	self changed