properties-setting
setFileTypeToObject
	"On the Macintosh, set the file type and creator of this file to be a Squeak object file. On other platforms, do nothing. Setting the file type allows Squeak object files to be sent as email attachments and launched by double-clicking. On other platforms, similar behavior is achieved by creating the file with the '.sqo' file name extension."

	FileDirectory default
		setMacFileNamed: self fullName
		type: 'SOBJ'
		creator: 'FAST'.
