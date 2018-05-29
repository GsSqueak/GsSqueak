accessing
pages: aMorphList

	pages := aMorphList asOrderedCollection.

	"It is tempting to force the first page to be the current page.  But then, two pages might be shown at once!  Just trust the copying mechanism and let currentPage be copied correctly. --Ted."