initialize-release
acceptFileName
	"make sure to accept any edit in the filename before closing"

	self changed: #acceptChanges.
	^super acceptFileName