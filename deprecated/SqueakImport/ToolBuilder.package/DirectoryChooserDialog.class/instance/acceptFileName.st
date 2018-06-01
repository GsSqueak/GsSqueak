initialize-release
acceptFileName
	"User clicked to accept the current state so save the directory and close the dialog"

	finalChoice := directory.
	self changed: #close