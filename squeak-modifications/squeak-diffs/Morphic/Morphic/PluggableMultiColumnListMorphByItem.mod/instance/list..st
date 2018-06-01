initialization
list: arrayOfStrings 
	"Set the receivers items to be the given list of strings."
	"Note: the instance variable 'items' holds the original list.  
	The instance variable 'list' is a paragraph constructed from  
	this list."
"NO LONGER TRUE.  list is a real list, and listItems is obsolete."
self isThisEverCalled .
	itemList := arrayOfStrings first.
	^ super list: arrayOfStrings