resource writing
writeResourceForm: aForm fromLocator: aLocator
	"The given form has been externalized before. If it was reasonably compressed, use the bits of the original data - this allows us to recycle GIF, JPEG, PNG etc. data without using the internal compression (which is in most cases inferior). If necessary the data will be retrieved from its URL location. This retrieval is done only if the resouce comes from either
		* the local disk (in which case the file has never been published)
		* the browser cache (in which case we don't cache the resource locally)
	In any other case we will *not* attempt to retrieve it, because doing so can cause the system to connect to the network which is probably not what we want. It should be a rare case anyways; could only happen if one clears the squeak cache selectively."
	| fName fStream url data |
	"Try to be smart about the name of the file"
	fName := (aLocator urlString includes: $:)
		ifTrue: [
			url := aLocator urlString asUrl.
			url path last]
		ifFalse: [aLocator urlString].
	fName isEmptyOrNil ifFalse:[fName := fName asFileName].
	(fName isEmptyOrNil or:[localDirectory isAFileNamed: fName]) ifTrue:[
		"bad luck -- duplicate name"
		fName := localDirectory 
				nextNameFor:'resource' 
				extension: (FileDirectory extensionFor: aLocator urlString)].
	"Let's see if we have cached it locally"
	ResourceManager
		lookupCachedResource: self baseUrl , aLocator urlString
		ifPresentDo:[:stream | data := stream upToEnd].
	"Check if the cache entry is without qualifying baseUrl. Workaround for older versions."
	data ifNil:[
		ResourceManager
			lookupCachedResource: aLocator urlString
			ifPresentDo:[:stream | data := stream upToEnd]].
	data ifNil:[
		"We don't have it cached locally. Retrieve it from its original location."
		((url notNil and: [url hasRemoteContents]) and:[HTTPClient isRunningInBrowser not])
			ifTrue:[^nil]. "see note above"
		(Url schemeNameForString: aLocator urlString)
			ifNil: [^nil].
		data := HTTPLoader default retrieveContentsFor: aLocator urlString.
		data ifNil:[^nil].
		data := data content.
	].
	"data size > aForm bits byteSize ifTrue:[^nil]."
	fStream := localDirectory newFileNamed: fName.
	fStream binary.
	fStream nextPutAll: data.
	fStream close.
	^{fName. data size}