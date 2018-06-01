fetch from disk
xxxFetch
	"Bring in my object and replace all references to me with references to him.  First try looking up my url in the pageCache.  Then try the page (and install it, under its url).  Then start from scratch with the url."

	| truePage object existing |
	existing := SqueakPageCache pageCache at: url ifAbsent: [nil].
	existing ifNotNil: [existing isContentsInMemory
		ifTrue: [page := truePage := existing]].	"This url already has an object in this image"
	truePage ifNil: [
		truePage := SqueakPageCache atURL: url oldPage: page].
	object := truePage isContentsInMemory 
		ifTrue: [truePage contentsMorph]
		ifFalse: [truePage fetchInformIfError].	"contents, not the page"
			"Later, collect pointers to object and fix them up.  Not scan memory"
	object ifNil: [^ 'Object could not be fetched.'].
	"recursionFlag := false."  	"while I still have a pointer to myself"
	truePage contentsMorph: object.
	page := truePage.
	self xxxFixup.
	^ object	"the final object!"
 