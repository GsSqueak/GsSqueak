private
createRequestFor: name in: aLoader
	| request |
	request := super createRequestFor: name in: aLoader.
	request cachedName: cacheDir, name.
	^request