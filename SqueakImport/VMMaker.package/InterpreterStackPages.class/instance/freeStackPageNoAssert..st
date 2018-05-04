page access
freeStackPageNoAssert: aPage "<InterpreterStackPage>"
	"MRUP-->used page<->used page<->used page<->used page<--LRUP
	               ^                        <-next-prev->                         ^
	                |                                                                       |
	                v                        <-prev-next->                         v
	                free page<->free page<->free page<->free page"
	| prev |
	<var: #aPage type: #'StackPage *'>
	<var: #prev type: #'StackPage *'>
	aPage setBaseFP: 0.
	aPage == mostRecentlyUsedPage ifTrue:
		[mostRecentlyUsedPage := mostRecentlyUsedPage prevPage.
		 ^nil].
	"lack of type inferrence means ``self isFree: aPage prevPage''
	 isn't turned into a direct field test; sigh..."
	prev := aPage prevPage.
	(self isFree: prev) ifTrue:
		[^nil].
	prev setNextPage: aPage nextPage.
	aPage nextPage setPrevPage: prev.
	aPage setNextPage: mostRecentlyUsedPage nextPage.
	mostRecentlyUsedPage nextPage setPrevPage: aPage.
	aPage setPrevPage: mostRecentlyUsedPage.
	mostRecentlyUsedPage setNextPage: aPage