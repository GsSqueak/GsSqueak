instance creation
newBookmarkForURL: aURLString

	^ (self newForURL: aURLString) isBookmark: true
