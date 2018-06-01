downloading
loadRemoteObjects
	"Load a remote image segment and extract the root objects.
	Check if the remote file is a zip archive."
	"'http://bradley.online.disney.com/games/subgame/squeak-test/assetInfo.extSeg' 
		asUrl loadRemoteObjects" 
	"'http://bradley.online.disney.com/games/subgame/squeak-test/assetInfo.zip' 
		asUrl loadRemoteObjects" 

	| stream info data extension |
 	data := self retrieveContents content.
	extension := (FileDirectory extensionFor: self path last) asLowercase.
	(#('zip' 'gzip') includes: extension)
		ifTrue: [data := (GZipReadStream on: data) upToEnd].
"	stream := StreamWrapper streamOver: (ReadStream on: data)."
	stream := RWBinaryOrTextStream on: data.
	stream reset.
	info := stream fileInObjectAndCode.
	stream close.
	^info arrayOfRoots