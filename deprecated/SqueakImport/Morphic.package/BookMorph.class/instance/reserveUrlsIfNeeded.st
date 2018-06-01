menu
reserveUrlsIfNeeded
	"See if this book needs to pre-allocate urls.  Harmless if have urls already.  Actually writes dummy files to reserve names."

| baddies bad2 |
pages size > 25 ifTrue: [^ self reserveUrls].
baddies := BookPageThumbnailMorph withAllSubclasses.
bad2 := FlexMorph withAllSubclasses.
pages do: [:aPage |
	aPage allMorphsDo: [:mm | 
		(baddies includes: mm class) ifTrue: [^ self reserveUrls].
		(bad2 includes: mm class) ifTrue: [
			mm originalMorph class == aPage class ifTrue: [
				^ self reserveUrls]]]].
		
