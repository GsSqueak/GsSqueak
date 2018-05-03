page access
markStackPageLeastMostRecentlyUsed: page "<InterpreterStackPage>"
	"This method is used to move a page to the end of the used pages.
	 This is to keep asserts checking pageListIsWellFormed happy."

	"MRUP-->used page<->used page<->used page<->used page<--LRUP
	               ^                        <-next-prev->                         ^
	                |                                                                       |
	                v                        <-prev-next->                         v
	                free page<->free page<->free page<->free page"

	<var: #page type: #'StackPage *'>
	<returnTypeC: #void>
	| lastUsedPage |
	<var: #lastUsedPage type: #'StackPage *'>
	self assert: page = mostRecentlyUsedPage nextPage.
	lastUsedPage := page nextPage.
	[lastUsedPage isFree] whileTrue:
		[lastUsedPage := lastUsedPage nextPage].
	lastUsedPage nextPage = page ifTrue:
		[^nil].
	page prevPage setNextPage: page nextPage.
	page nextPage setPrevPage: page prevPage.
	lastUsedPage prevPage setNextPage: page.
	page setPrevPage: lastUsedPage prevPage.
	page setNextPage: lastUsedPage.
	lastUsedPage setPrevPage: page.
	self assert: self pageListIsWellFormed