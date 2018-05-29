other
adjustCurrentPageForFullScreen
	"Adjust current page to conform to whether or not I am in full-screen mode.  Also, enforce uniform page size constraint if appropriate"

	self isInFullScreenMode
		ifTrue:
			[(currentPage hasProperty: #sizeWhenNotFullScreen) ifFalse:
				[currentPage setProperty: #sizeWhenNotFullScreen toValue: currentPage extent].
			currentPage extent: Display extent]
		ifFalse:
			[(currentPage hasProperty: #sizeWhenNotFullScreen) ifTrue:
				[currentPage extent: (currentPage valueOfProperty: #sizeWhenNotFullScreen).
				currentPage removeProperty: #sizeWhenNotFullScreen].
			self uniformPageSize ifNotNil:
				[:anExtent | currentPage extent: anExtent]].
	(self valueOfProperty: #floatingPageControls) ifNotNil:
		[:pc | pc isInWorld ifFalse: [pc openInWorld]]