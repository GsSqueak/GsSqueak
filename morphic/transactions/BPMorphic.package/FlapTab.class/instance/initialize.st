initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	edgeToAdhereTo := #left.
	flapShowing := false.
	slidesOtherObjects := false.
	popOutOnDragOver := false.
	popOutOnMouseOver := false.
	inboard := false.
	dragged := false