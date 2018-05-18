properties-setting
getFileType
	"On the Macintosh, get the file type and creator of this file. On other platforms, do nothing."

	^FileDirectory default
		getMacFileTypeAndCreator: self fullName
		
