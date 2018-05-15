accessing
adjustToDownloadUrl: downloadUrl
	"Adjust the resource manager to the current download location. A project might have been moved manually to a different location or server."

	downloadUrl isEmptyOrNil ifTrue: [^self].

	self resourceMap
		keysDo:[:locator | locator adjustToDownloadUrl: downloadUrl].
	self resourceMap rehash.
	unloaded rehash