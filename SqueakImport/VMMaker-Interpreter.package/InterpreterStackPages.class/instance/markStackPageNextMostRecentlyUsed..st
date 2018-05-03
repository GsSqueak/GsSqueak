page access
markStackPageNextMostRecentlyUsed: page "<InterpreterStackPage>"
	"This method is used to move a page to a position in the list such that it cannot
	 be deallocated when a new page is allocated, without changing the most recently
	 used page.  There must be at least 3 pages in the system.  So making the page
	 the MRU's prevPage is sufficient to ensure it won't be deallocated."

	"MRUP-->used page<->used page<->used page<->used page<--LRUP
	               ^                        <-next-prev->                         ^
	                |                                                                       |
	                v                        <-prev-next->                         v
	                free page<->free page<->free page<->free page"

	<var: #page type: #'StackPage *'>
	self assert: page ~~ mostRecentlyUsedPage.
	page nextPage == mostRecentlyUsedPage ifTrue:
		[^nil].
	page prevPage setNextPage: page nextPage.
	page nextPage setPrevPage: page prevPage.
	mostRecentlyUsedPage prevPage setNextPage: page.
	page setPrevPage: mostRecentlyUsedPage prevPage.
	page setNextPage: mostRecentlyUsedPage.
	mostRecentlyUsedPage setPrevPage: page.
	self assert: self pageListIsWellFormed