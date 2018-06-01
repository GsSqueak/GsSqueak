initialize-release
acceptFileName
	"User clicked to accept the current state so save the filename and close the dialog"

	finalChoice := fileName.
	self changed: #close