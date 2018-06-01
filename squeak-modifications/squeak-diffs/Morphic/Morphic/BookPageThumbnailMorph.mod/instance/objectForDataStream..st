fileIn/Out
objectForDataStream: refStrm
	"I am about to be written on an object file.  It would be bad to write a whole BookMorph out.  Store a string that is the url of the book or page in my inst var."

	| clone bookUrl bb stem ind |
	(bookMorph isString) & (page isString) ifTrue: [
		^ super objectForDataStream: refStrm].
	(bookMorph isNil) & (page isString) ifTrue: [
		^ super objectForDataStream: refStrm].
	(bookMorph isNil) & (page url notNil) ifTrue: [
		^ super objectForDataStream: refStrm].
	(bookMorph isNil) & (page url isNil) ifTrue: [
		self error: 'page should already have a url' translated.
		"find page's book, and remember it"
		"bookMorph := "].
	
	clone := self shallowCopy.
	(bookUrl := bookMorph url)
		ifNil: [bookUrl := self valueOfProperty: #futureUrl].
	bookUrl 
		ifNil: [	bb := RectangleMorph new.	"write out a dummy"
			bb bounds: bounds.
			refStrm replace: self with: bb.
			^ bb]
		ifNotNil: [clone instVarNamed: 'bookMorph' put: bookUrl].

	page url ifNil: [
			"Need to assign a url to a page that will be written later.
			It might have bookmarks too.  Don't want to recurse deeply.  
			Have that page write out a dummy morph to save its url on the server."
		stem := SqueakPage stemUrl: bookUrl.
		ind := bookMorph pages identityIndexOf: page.
		page reserveUrl: stem,(ind printString),'.sp'].
	clone instVarNamed: 'page' put: page url.
	refStrm replace: self with: clone.
	^ clone