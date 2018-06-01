requests
retrieveObjectsFor: aURL
	"Load a remote image segment and extract the root objects.
	Check if the remote file is a zip archive."
	"'http://bradley.online.disney.com/games/subgame/squeak-test/assetInfo.extSeg' 
		asUrl loadRemoteObjects" 
	"'http://bradley.online.disney.com/games/subgame/squeak-test/assetInfo.zip' 
		asUrl loadRemoteObjects" 

	| stream info data |
 	data := self retrieveContentsFor: aURL.
	(data isString)
		ifTrue: [^self error: data]
		ifFalse: [data := data content].
	(data beginsWith: 'error')
		ifTrue: [^self error: data].
	data := data unzipped.
	stream := RWBinaryOrTextStream on: data.
	stream reset.
	info := stream fileInObjectAndCode.
	stream close.
	^info originalRoots