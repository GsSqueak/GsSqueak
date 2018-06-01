file directory
fileNamed: fullName
	"Create a RemoteFileStream for writing.  If the file exists, do not complain.  fullName is directory path, and does include name of the server.  Or it can just be a fileName.  Only write the data upon close."

	| file remoteStrm |
	file := self asServerFileNamed: fullName.
	file readWrite.
	file isTypeFile ifTrue: [
		^ FileStream fileNamed: (file fileNameRelativeTo: self)
	].

	remoteStrm := RemoteFileStream on: (String new: 2000).
	remoteStrm remoteFile: file.
	^ remoteStrm	"no actual writing till close"
