accessing
makeAllProjectResourcesLocalTo: resourceUrl
	"Change the urls in the resource locators so project specific resources are stored and referenced locally. Project specific resources are all those that are kept locally in any of the project's versions."

	| locators projectBase |
 	"Construct the version neutral project base"
	resourceUrl isEmptyOrNil ifTrue: [^self].
	projectBase := resourceUrl copyFrom: 1 to: (resourceUrl lastIndexOf: $.) - 1.
	locators := OrderedCollection new.
	self resourceMap
		keysAndValuesDo:[:loc :res | res ifNotNil: [locators add: loc]].
	locators do: [:locator |
		| locUrl |
		locUrl := locator urlString.
		locUrl ifNotNil: [
			| lastSlash |
			lastSlash := locUrl lastIndexOf: $/.
			lastSlash > 0
				ifTrue: [
					| locBase localResource isExternal |
					locBase := locUrl copyFrom: 1 to: lastSlash - 1.
					locBase := locBase copyFrom: 1 to: (((locBase lastIndexOf: $.) - 1) max: 0).
					isExternal := projectBase ~= locBase.
					(isExternal not
						or: [self localizeAllExternalResources])
						ifTrue: [
							localResource := locUrl copyFrom: lastSlash+1 to: locUrl size.
							"Update the cache entry to point to the new resource location"
							ResourceManager renameCachedResource: locUrl to: (resourceUrl , localResource) external: isExternal.
							locator urlString: localResource]]]].
	self resourceMap rehash
