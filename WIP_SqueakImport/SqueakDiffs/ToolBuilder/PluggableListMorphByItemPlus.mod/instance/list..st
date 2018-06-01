initialization
list: arrayOfStrings
	"Set the receivers items to be the given list of strings."
	"Note: the instance variable 'items' holds the original list.
	 The instance variable 'list' is a paragraph constructed from
	 this list."
"NOTE: this is no longer true; list is a real list, and itemList is no longer used.  And this method shouldn't be called, incidentally."
self isThisEverCalled .
	itemList := arrayOfStrings.
	^ super list: arrayOfStrings