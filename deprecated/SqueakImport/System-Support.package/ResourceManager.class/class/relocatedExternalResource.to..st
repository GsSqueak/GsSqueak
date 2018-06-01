private-resources
relocatedExternalResource: urlString to: newUrlString
	| originalURL |
	originalURL := (self localizedExternalResources includesKey: urlString)
		ifTrue: [self localizedExternalResources at: urlString]
		ifFalse: [urlString].
	self localizedExternalResources at: newUrlString put: originalURL