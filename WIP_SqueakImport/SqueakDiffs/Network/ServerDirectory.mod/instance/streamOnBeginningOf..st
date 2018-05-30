file directory
streamOnBeginningOf: serverFile

	| remoteStrm |
	remoteStrm := RemoteFileStream on: (String new: 2000).
	remoteStrm remoteFile: serverFile.
	serverFile getFileNamed: serverFile fileName into: remoteStrm.	"prefetch data"
	^ remoteStrm