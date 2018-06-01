cache access
atURL: aURLString oldPage: aPage
	"Bring in page and return the object.  First try looking up my url in the pageCache.  Then try the page (and install it, under its url).  Then start from scratch with the url."

	| myPage |
	(myPage := PageCache at: aURLString ifAbsent: [nil]) ifNotNil: [
		^ myPage].
	aPage url: aURLString.	"for consistancy"
	PageCache at: aPage url put: aPage.
	^ aPage