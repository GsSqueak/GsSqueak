page access
markStackPageMostRecentlyUsed: page "<InterpreterStackPage>"
	"MRUP-->used page<->used page<->used page<->used page<--LRUP
	               ^                        <-next-prev->                         ^
	                |                                                                       |
	                v                        <-prev-next->                         v
	                free page<->free page<->free page<->free page"
	<var: #page type: #'StackPage *'>
	<asmLabel: false>
	page == mostRecentlyUsedPage ifTrue:
		[^nil].
	"Common case; making new page most recently used."
	page prevPage == mostRecentlyUsedPage ifTrue:
		[mostRecentlyUsedPage := page.
		 self assert: self pageListIsWellFormed.
		 ^nil].
	page prevPage setNextPage: page nextPage.
	page nextPage setPrevPage: page prevPage.
	mostRecentlyUsedPage nextPage setPrevPage: page.
	page setPrevPage: mostRecentlyUsedPage.
	page setNextPage: mostRecentlyUsedPage nextPage.
	mostRecentlyUsedPage setNextPage: page.
	mostRecentlyUsedPage := page.
	self assert: self pageListIsWellFormed