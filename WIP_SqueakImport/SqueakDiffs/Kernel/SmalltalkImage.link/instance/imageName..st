image, changes names
imageName: newName
	"Set the the full path name for the current image.  All further snapshots will use this."

	self primImageName: newName asVmPathName.
