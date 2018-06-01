other
setExtentFromHalo: anExtent 
	"The user has dragged the grow box such that the receiver's extent
	would be anExtent. Do what's needed. For a BookMorph, we assume
	any resizing attempt is a request that the book-page currently being
	viewed be resized accoringly; this will typically not affect unseen book
	pages, though there is a command that can be issued to harmonize
	all book-page sizes, and also an option to set that will maintain all
	pages at the same size no matter what."
	currentPage isInWorld
		ifTrue: [currentPage width: anExtent x.
			currentPage height: anExtent y - (self innerBounds height - currentPage height).
			self maintainsUniformPageSize
				ifTrue: [self setProperty: #uniformPageSize toValue: currentPage extent]]
		ifFalse: ["doubtful case mostly"
			super setExtentFromHalo: anExtent]