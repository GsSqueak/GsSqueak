initialize-release
open
	"PluggableFileList is being deprecated and this can go away soon"
	self deprecated: 'PluggableFileList must die'.

	^ Project uiManager openPluggableFileList: self label: prompt in: self currentWorld