initialize-release
cancelFileChooser
	"User clicked to cancel the current state so nil the filename and close the dialog"

	directory := finalChoice := fileName := nil.
	self changed: #close.